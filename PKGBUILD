# Maintainer: Christian Kohlstedde <christian+aur@kohlsted.de>
# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Alex 'AdUser' Z <ad_user@mail.ru>
pkgname=rdfind
pkgver=1.4.1
pkgrel=1
pkgdesc='Redundant data find - a program that finds duplicate files.'
arch=('i686' 'x86_64')
url='http://rdfind.pauldreik.se'
license=('GPL2')
depends=('nettle')
changelog=Changelog
source=(
    "${url}/${pkgname}-${pkgver}.tar.gz"
    "${url}/${pkgname}-${pkgver}.tar.gz.asc"
    )
validpgpkeys=(
    "2E479B1D5AD85FC43972F0B15C4A26CD4CC8C397"
    )
sha256sums=(
    '30c613ec26eba48b188d2520cfbe64244f3b1a541e60909ce9ed2efb381f5e8c'
    'SKIP'
    )

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make -s
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
    make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}/" install

# documentation
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    install -m644 \
    AUTHORS \
    ChangeLog \
    README \
    TODO \
    "$pkgdir/usr/share/doc/$pkgname"
}

