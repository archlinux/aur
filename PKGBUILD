# vim: filetype=bash
# Maintainer: amano.kenji <amano.kenji@proton.me>
pkgname=janet-posix-spawn
pkgver=0.0.1.r2021.02.17
pkgrel=3
pkgdesc="A process API for janet wrapping posix-spawn(3)"
arch=("x86_64")
url="https://github.com/andrewchambers/janet-posix-spawn"
license=("MIT")
depends=("janet-lang")
options=("staticlibs")
_commit="5a3689c250a207186bcb1a30f131d71e45b8cea6"
source=("$pkgname-$pkgver.tar.gz::https://github.com/andrewchambers/janet-posix-spawn/archive/${_commit}.tar.gz")
sha256sums=('2171b724504908753f4684a8c8d0fa49468a7c94ad001a4219a76a29914851d4')

build() {
  cd $pkgname-$_commit
  jpm build
}

package() {
  cd $pkgname-$_commit
  install -D -t "${pkgdir}/usr/share/doc/${pkgname}" README.md API.md
  modpath="$(janet -e '(print (dyn :syspath))')"
  mkdir -p "${pkgdir}/${modpath}"
  jpm --dest-dir="${pkgdir}" --modpath="${modpath}" --binpath="/usr/bin" install
}
