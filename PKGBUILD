# Maintainer: Levai, Daniel <leva at ecentrum.hu>

pkgbase='kc'
pkgname='kc-full'
pkgver=2.5.3
pkgrel=1
pkgdesc="console-based password manager - YubiKey, scrypt, PCRE and readline support"
arch=('any')
url="https://github.com/levaidaniel/kc"
license=('BSD-2-Clause')
conflicts=('kc')
depends=('libbsd>=0.2.0'
'libxml2>=2.6.0'
'openssl>=1.1.1'
'yubikey-personalization>=1.20.0'
'yubico-c>=1.13'
'libscrypt>=1.14'
'pcre>=8.12'
'readline'
)
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/levaidaniel/${pkgbase}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('593db34bf53ad9197c3ac1ffc3742dfc03a784862f0a5fadeda6b6d2ad287539')


build() {
  cd "${pkgbase}-${pkgver}"
  make HAVE_PCRE=y HAVE_LIBSCRYPT=y HAVE_YUBIKEY=y -f Makefile.linux
}

package() {
  cd "${pkgbase}-${pkgver}"
  make HAVE_PCRE=y HAVE_LIBSCRYPT=y HAVE_YUBIKEY=y -f Makefile.linux install DESTDIR="${pkgdir}/" PREFIX=/usr
  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 'Changelog.md' -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -m644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
