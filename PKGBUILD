# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='openvpn-otp'
pkgver='1.0'
pkgrel='3'
pkgdesc='This plugin adds support for TOTP and HOTP tokens (like Google Authenticator) for OpenVPN.'
arch=('any')
url="https://github.com/evgeny-gridasov/${pkgname}"
license=('GPL')
depends=('openvpn')
source=("${url}/archive/v${pkgver}.tar.gz")
makedepends=('openssl')
md5sums=('3ff2b8f9cc054ccac31f99e9ee704f67')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --with-openvpn-plugin-dir="/usr/lib/openvpn/plugins"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
