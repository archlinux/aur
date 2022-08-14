# Maintainer: Denis Oster <denis.oster.dev@gmail.com>

pkgname=wm-launch
pkgver=0.5.1
pkgrel=1
pkgdesc="Tool to launch X11 clients with unique IDs"
arch=("x86_64")
url="https://github.com/jcrd/wm-launch"
license=("GPL" 'custom:GPL3 or any later version')
depends=(libx11)
makedepends=(
  go
  perl
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/jcrd/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
   pod2man.patch
)
sha256sums=(
  aedd313507ee44ea9b98094e3435b6677cd316b7e847d42e80089d31a6f00492
  bbd22ae11c45efd75ea43f032e76736afdf947557010fbf5671579bb6a4dafc6
)
_srcdir="${pkgname}-${pkgver}"

prepare() {
  patch --directory="${_srcdir}" --forward --strip=1 --input="$srcdir/pod2man.patch"
}

build() {
  make -C "${_srcdir}" -O V=1 VERBOSE=1 PREFIX=/usr
}

package() {
  make install -C "${_srcdir}" -O V=1 VERBOSE=1 DESTDIR="${pkgdir}" PREFIX=/usr
   
  install -Dm644 "${_srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
