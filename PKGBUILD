# Maintainer: Samuel Bernardo <samuelbernardo.mail at gmail dot com>
# Maintainer: Alex D'Andrea <alex at dandrea dot io>

pkgbase=oidc-agent
pkgname=('oidc-agent')
pkgver=5.1.0
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
         'qrencode'
         'webkit2gtk')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/indigo-dc/oidc-agent/archive/v${pkgver}.tar.gz")
sha256sums=('13562f08bd88dbb31f57f3d49a5f4094c3b974f31f4116cbea567877a8e468b4')

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
