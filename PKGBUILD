# vim: filetype=bash
# Maintainer: amano.kenji <amano.kenji@proton.me>
pkgname=janet-jdn
pkgver=0.0.1.r2021.02.05
pkgrel=2
pkgdesc="Janet data notation."
arch=("x86_64")
url="https://github.com/andrewchambers/janet-jdn"
license=("MIT")
depends=("janet-lang")
options=("staticlibs")
_commit="c0951f6978555268a24d86eee2f118327328b40b"
source=("$pkgname-$pkgver.tar.gz::https://github.com/andrewchambers/janet-jdn/archive/${_commit}.tar.gz")
sha256sums=('eaaff4b5300941cbb26183fe0f03271145d10c0d63aa2e0daf3a2eee43c89853')

build() {
  cd $pkgname-$_commit
  jpm build
}

package() {
  cd $pkgname-$_commit
  install -D -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
  modpath="$(janet -e '(print (dyn :syspath))')"
  mkdir -p "${pkgdir}/${modpath}"
  jpm --dest-dir="${pkgdir}" --modpath="${modpath}" --binpath="/usr/bin" install
}
