# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>

pkgname=omi
pkgver=1.9.0_0
pkgrel=3
pkgdesc='Open Management Infrastructure (OMI) is an open source project to further the development of a production quality implementation of the DMTF CIM/WBEM standards.'
arch=('i686' 'x86_64')
url='https://github.com/Microsoft/omi'
license=('MIT')
install='omi.install'
makedepends=('lsb-release')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Microsoft/omi/archive/v${pkgver//_/-}.tar.gz"
            'omi-configure.patch'
            'omi.install')
sha256sums=('42227b31f6e6e20079a635bb7b3789a21541027169e7958fb868aa30cfcef32d'
            'c0df8d4e828eddad0db621845d4f32f516a7195fff6cbed38d298bb16630c4b5'
            'd67b335937f7b3e2bff576ce007536df9b3bacc6ed8b286f09b233f0e513871f')

prepare() {
  cd "$pkgname-${pkgver//_/-}"
  patch --forward --strip=1 --input=../omi-configure.patch
}

build() {
  cd "$pkgname-${pkgver//_/-}/Unix"
  ./configure --enable-microsoft
  make
}

package() {
  cd "$pkgname-${pkgver//_/-}/Unix"
  make install DESTDIR="$pkgdir"

  install -Dm 644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
