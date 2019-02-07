# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='openvpn-otp'
pkgver='1.0'
pkgrel='2'
pkgdesc='This plugin adds support for TOTP and HOTP tokens (like Google Authenticator) for OpenVPN.'
arch=('any')
url="https://github.com/evgeny-gridasov/${pkgname}"
license=('GPL')
depends=('openvpn')
source=("${pkgname}::git+${url}")
makedepends=('git' 'openssl')
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"
  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --with-openvpn-plugin-dir="/usr/lib/openvpn/plugins"
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}
