# Maintainer: Hristo Voyvodov <hristo.voyvodov@hotmail.com>

pkgname=pluto-bin
pkgver=5.24.3
pkgrel=1
pkgdesc='Pluto is a utility to help users find deprecated Kubernetes apiVersions in their code repositories and their helm releases.'
arch=(x86_64)
url='https://github.com/FairwindsOps/pluto'
license=(Apache)
source=("$pkgname-$pkgver.tar.gz::https://github.com/FairwindsOps/pluto/releases/download/v$pkgver/pluto_${pkgver}_linux_amd64.tar.gz")
sha256sums=('f03bcf0ef81ddd2f2a73e7f6f3542f0e0e14ad3213cbdab725dd55dd1c8766ea')

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
