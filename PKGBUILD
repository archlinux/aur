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
sha256sums=('ffc7485fb3d7b5f21ff36e6ce15e3d42237c76b7c4143a859496bbb6349a9dcc')


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
