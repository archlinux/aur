# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
pkgname=docbook2mdoc
pkgver=1.1.0
pkgrel=0
pkgdesc='DocBook refentry to mdoc(7) converter'
url='https://mandoc.bsd.lv/docbook2mdoc/'
license=('custom: ISC')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('libbsd')
source=("$url/snapshots/$pkgname-$pkgver.tgz"
        "$pkgname.patch")
sha256sums=('9fc6411cf041ff10e76f19a50a142075a8df9d343f248e20d8fc98bf8e547c71'
            'da7090a483da4a7298dedd26bf59d5ac0b749f2d445c49f831e2dd5049f471f2')

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
