# vim: filetype=bash
# Maintainer: amano.kenji <amano.kenji@proton.me>
pkgname=janet-sh
pkgver=0.0.1.r2022.07.07
pkgrel=1
pkgdesc="Shorthand shell like functions for janet."
arch=("x86_64")
url="https://github.com/andrewchambers/janet-posix-sh"
license=("MIT")
depends=("janet-posix-spawn")
_commit="ec620d5d7310b3682dd0f7bfa86eae6b244d1510"
source=("$pkgname-$pkgver.tar.gz::https://github.com/andrewchambers/janet-sh/archive/${_commit}.tar.gz")
sha256sums=('4eddcd6333d59138ba5c8094dd947e26f5eb6382baf46ad5043a1f7695ad9502')

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
  _modpath="$(janet -e '(print (dyn :syspath))')"
  mkdir -p "${pkgdir}/${_modpath}"
  jpm --modpath="${pkgdir}/${_modpath}" --binpath="${pkgdir}/usr/bin" install
}
