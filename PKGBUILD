# Maintainer: Samuel Bernardo <samuelbernardo.mail at gmail dot com>
# Maintainer: Alex D'Andrea <alex at dandrea dot io>

pkgbase=oidc-agent
pkgname=('oidc-agent')
pkgver=5.3.3
pkgrel=1
pkgdesc='A set of tools to manage OpenID Connect tokens and make them easily usable from the command line'
arch=('x86_64')
license=('MIT')
url='https://github.com/indigo-dc/oidc-agent'
makedepends=('help2man')
depends=('libmicrohttpd'
         'libsodium'
         'curl'
         'qrencode'
         'webkit2gtk')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/indigo-dc/oidc-agent/archive/v${pkgver}.tar.gz")
sha256sums=('5ced1d942807eb058b339ad3444b0112be568836cf5eb1bea0e2c26b1885762d')

build() {
  cd "$srcdir"/${pkgbase}-${pkgver}
  make
}

package() {
  cd "$srcdir"/"${pkgbase}-${pkgver}"
  make install_lib PREFIX="$pkgdir" LIB_PATH="$pkgdir/usr/lib" BIN_AFTER_INST_PATH="/usr"
  make install PREFIX="$pkgdir" LIB_PATH="$pkgdir/usr/lib" BIN_AFTER_INST_PATH="/usr"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
