# Maintainer: Samuel Bernardo <samuelbernardo.mail at gmail dot com>
# Maintainer: Alex D'Andrea <alex at dandrea dot io>

pkgbase=oidc-agent
pkgname=('oidc-agent')
pkgver=5.3.8
pkgrel=1
pkgdesc='A set of tools to manage OpenID Connect tokens and make them easily usable from the command line'
arch=('x86_64')
license=('MIT')
url='https://github.com/indigo-dc/oidc-agent'
makedepends=('gcc' 'help2man' 'make')
depends=('bash'
         'curl'
         'glib2'
         'gtk3'
         'libgcc'
         'libmicrohttpd'
         'libsodium'
         'qrencode'
         'webkit2gtk-4.1'
         )
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/indigo-dc/oidc-agent/archive/v${pkgver}.tar.gz")
sha256sums=('96d35f2abe3ccbdce8d1a8b4bb1dcb381c0d6c0ee8a51d4ee3d918323b5b4ef7')

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
