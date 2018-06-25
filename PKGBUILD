# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=compleat-git
_pkgname=compleat
pkgver=r119.4923685
pkgrel=1
pkgdesc="Bash completion for human being"
url="https://limpet.net/mbrubeck/2009/10/30/compleat.html"
license=("custom")
makedepends=('stack')
arch=('any')
source=("${_pkgname}"::'git+https://github.com/mbrubeck/compleat.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "$srcdir/${_pkgname}"
  make
}

package() {
  mkdir -p ${pkgdir}/usr/{bin,share/doc/$_pkgname/examples}
  cd "$srcdir/${_pkgname}"
  stack install --local-bin-path=${pkgdir}/usr/bin/
  install -Dm644 compleat_setup ${pkgdir}/etc/bash_completion.d/compleat_setup
  install -Dm644 examples/* ${pkgdir}/usr/share/doc/$_pkgname/examples
  install -Dm644 README.markdown ${pkgdir}/usr/share/doc/$_pkgname
}
