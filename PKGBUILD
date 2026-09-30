# Maintainer: Hristo Voyvodov <hristo.voyvodov@hotmail.com>

pkgname=pluto-bin
pkgver=5.24.4
pkgrel=1
pkgdesc='Pluto is a utility to help users find deprecated Kubernetes apiVersions in their code repositories and their helm releases.'
arch=(x86_64)
url='https://github.com/FairwindsOps/pluto'
license=(Apache)
source=("$pkgname-$pkgver.tar.gz::https://github.com/FairwindsOps/pluto/releases/download/v$pkgver/pluto_${pkgver}_linux_amd64.tar.gz")
sha256sums=('1e5077ce1016fb0bb8ce0103c12b7ca8666eb3959d787ecfc95d9b8acd507147')

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
