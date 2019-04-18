# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
pkgname=docbook2mdoc
pkgver=1.0.0
pkgrel=1
pkgdesc='DocBook refentry to mdoc(7) converter'
license=('custom: ISC')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://mandoc.bsd.lv/docbook2mdoc/'
makedepends=('libbsd')
source=("$url/snapshots/$pkgname-$pkgver.tgz"
        "$pkgname.patch")
sha256sums=('940b774abfc9fb60c8d9cf46cecbf704c5a60fbb4f6ca85073fdfda26706629c'
            'c2570e46266fe64d6493095ec29da1b77919bc7fcc314e1d40e9a383e3a7a796')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i "${srcdir}/$pkgname.patch"
}

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install

  install -d "${pkgdir}/usr/share/licenses/$pkgname"
  sed -n '3,16p' docbook2mdoc.c | cut -c 4- \
    > "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
