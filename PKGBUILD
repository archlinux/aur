# Maintainer: Peter Hoeg <firstname at lastname dot com>

pkgname=muttqt
pkgver=0.1.0
pkgrel=2
pkgdesc='Mutt Query Tool'
arch=('any')
url='http://github.com/tgray/muttqt'
license=('GPL')
depends=('python')
source=("muttqt-${pkgver}.tar.gz::https://github.com/tgray/${pkgname}/archive/${pkgver}.tar.gz"
        '0001-fix-sed.patch'
        '0002-use-python-2.patch'
        '0003-store-configuration-under-.config.patch')
sha1sums=('6df69a2e0c3548655e682eee7c848e7271e02b5f'
          '878b84d812a61a8179642cbfca4d2dcc9a22210d'
          'c71eccfdacd57e05597cdd92c1a3ad89a24864d6'
          '3591a0de11bbacf9cc79e65c196486a88a183e3c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < ../0001-fix-sed.patch
  patch -p1 < ../0002-use-python-2.patch
  patch -p1 < ../0003-store-configuration-under-.config.patch
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make prefix="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
