# Maintainer: Samuel Bernardo <samuelbernardo.mail at gmail dot com>

pkgbase=oidc-agent
pkgname=('oidc-agent')
pkgver=4.2.6
pkgrel=1
pkgdesc='A set of tools to manage OpenID Connect tokens and make them easily usable from the command line'
arch=('x86_64')
license=('MIT')
url='https://github.com/indigo-dc/oidc-agent'
makedepends=('help2man')
depends=('libmicrohttpd'
         'libseccomp'
         'libsecret'
         'libsodium'
         'curl'
         'qrencode')
source=(${pkgbase}-${pkgver}.tar.gz::https://github.com/indigo-dc/oidc-agent/archive/v${pkgver}.tar.gz)
sha256sums=('821f554d947082879cbc7be01a64b8edbbf88058f6b20b8ae38fbfe7d90eaabb')

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
