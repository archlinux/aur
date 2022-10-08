# Maintainer: Samuel Bernardo <samuelbernardo.mail at gmail dot com>

pkgbase=oidc-agent
pkgname=('oidc-agent')
pkgver=4.4.0
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
         'webkit2gtk-4.1')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/indigo-dc/oidc-agent/archive/v${pkgver}.tar.gz"
        "oidc-agent-4.4.0-webkit2gtk-4.1.patch")
sha256sums=('c8c2cb6c70e4e74a2be452d6238171947fab2da7920308f11c9bbe39669f4850'
            '6e35bf6b405448249e1a742e8b0c4165e807df68f39b61b79579277306c5e2f7')

prepare() {
  patch -Np1 -d "$pkgname-$pkgver" -i "${srcdir}/${pkgbase}-${pkgver}-webkit2gtk-4.1.patch"
}

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
