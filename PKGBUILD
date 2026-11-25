# Maintainer: Hristo Voyvodov <hristo.voyvodov@hotmail.com>

pkgname=pluto-bin
pkgver=5.24.5
pkgrel=2
pkgdesc='Pluto is a utility to help users find deprecated Kubernetes apiVersions in their code repositories and their helm releases.'
arch=(x86_64 armv7h aarch64)
url='https://github.com/FairwindsOps/pluto'
license=(Apache)

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/FairwindsOps/pluto/releases/download/v$pkgver/pluto_${pkgver}_linux_amd64.tar.gz")
source_armv7h=("$pkgname-$pkgver-armv7h.tar.gz::https://github.com/FairwindsOps/pluto/releases/download/v$pkgver/pluto_${pkgver}_linux_armv7.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/FairwindsOps/pluto/releases/download/v$pkgver/pluto_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('80076e01a320e1f4db30f5dbc927d204e61cd8abed66fa0b4644ca61cd86b39e')
sha256sums_armv7h=('b9bd8df055ba9c9628389c07a41935a0cc9352021e9576989b314e706b107ffd')
sha256sums_aarch64=('2b00f52285f0298ae7cec55d34e2387ed725584d072e67c8fa88bee662169f10')

package() {
  install -d -m 0755 \
    "${pkgdir}/usr/bin/" \
    "${pkgdir}/etc/bash_completion.d" \
    "${pkgdir}/usr/share/zsh/site-functions" \
    "${pkgdir}/usr/share/fish/completions" \
    "${pkgdir}/usr/share/pluto"

  install -Dm 755 "$srcdir/pluto" "$pkgdir/usr/bin/pluto"

  $pkgdir/usr/bin/pluto completion bash > ${pkgdir}/usr/share/pluto/completion.bash.inc
  $pkgdir/usr/bin/pluto completion zsh > ${pkgdir}/usr/share/pluto/completion.zsh.inc
  $pkgdir/usr/bin/pluto completion fish > ${pkgdir}/usr/share/pluto/completion.fish.inc

  ln -rsT "${pkgdir}/usr/share/pluto/completion.bash.inc" \
    "${pkgdir}/etc/bash_completion.d/pluto"

  ln -rsT "${pkgdir}/usr/share/pluto/completion.zsh.inc" \
    "${pkgdir}/usr/share/zsh/site-functions/_pluto"

  ln -rsT "${pkgdir}/usr/share/pluto/completion.fish.inc" \
    "${pkgdir}/usr/share/fish/completions/pluto.fish"

  install -Dm 755 "$srcdir/pluto" "$pkgdir/usr/bin/pluto"
}
