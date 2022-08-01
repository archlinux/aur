# vim: filetype=bash
# Maintainer: amano.kenji <amano.kenji@proton.me>
pkgname=janet-http
pkgver=0.1.0.r2021.10.19
pkgrel=4
pkgdesc="A janet http client library"
arch=("x86_64")
url="https://github.com/joy-framework/http"
license=("MIT")
depends=("janet-lang")
options=("staticlibs")
_commit="e3787820f1b5409757b2d23dcdf5a1dbf6539e65"
source=("$pkgname-$pkgver.tar.gz::https://github.com/joy-framework/http/archive/${_commit}.tar.gz")
sha256sums=('3f5fe5165d85ec0b7ff01625c0bb80e85e2e06c4b124d59184c6f796fa964d9f')

build() {
  cd http-$_commit
  jpm build
}

package() {
  cd http-$_commit
  install -D -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
  modpath="$(janet -e '(print (dyn :syspath))')"
  mkdir -p "${pkgdir}/${modpath}"
  jpm --dest-dir="${pkgdir}" --modpath="${modpath}" --binpath="/usr/bin" install
}
