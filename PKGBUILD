# vim: filetype=bash
# Maintainer: amano.kenji <amano.kenji@proton.me>
pkgname=janet-sh
pkgver=0.0.1.r2023.04.25
pkgrel=1
pkgdesc="Shorthand shell like functions for janet."
arch=("x86_64")
url="https://github.com/andrewchambers/janet-sh"
license=("MIT")
depends=("janet-posix-spawn")
options=("staticlibs")
_commit="221bcc869bf998186d3c56a388c8313060bfd730"
source=("$pkgname-$pkgver.tar.gz::https://github.com/andrewchambers/janet-sh/archive/${_commit}.tar.gz")
sha256sums=('63fd19148f6bd0989119e8023511f0d45b1fa73a4ca9913e6afcf060d0c0c819')

build() {
  cd $pkgname-$_commit
  jpm build
}

check() {
  cd $pkgname-$_commit
  jpm test
}

package() {
  cd $pkgname-$_commit
  install -D -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
  modpath="$(janet -e '(print (dyn :syspath))')"
  mkdir -p "${pkgdir}/${modpath}"
  jpm --dest-dir="${pkgdir}" --modpath="${modpath}" --binpath="/usr/bin" install
}
