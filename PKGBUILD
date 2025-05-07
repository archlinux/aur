# Maintainer: Levai, Daniel <leva at ecentrum.hu>

pkgname='kc'
pkgver=2.5.4
pkgrel=1
pkgdesc="console-based password manager - basic functionality with readline support"
arch=('any')
url="https://github.com/levaidaniel/kc"
license=('BSD-2-Clause')
conflicts=('kc-full')
depends=('libbsd>=0.2.0'
'libxml2>=2.6.0'
'openssl>=3.2.0'
'readline'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/levaidaniel/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0e6c07a4a6fcb8ebd3ae4a82a74d2869e3c055730da9997642170d86ea2b909b')


build() {
  cd "${pkgname}-${pkgver}"
  make HAVE_ARGON2=y -f Makefile.linux
}

package() {
  cd "${pkgname}-${pkgver}"
  make HAVE_ARGON2=y -f Makefile.linux install DESTDIR="${pkgdir}/" PREFIX=/usr
  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 'Changelog.md' -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -m644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
