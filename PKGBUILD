# Maintainer: Samuel Bernardo <samuel at lip dot pt>

pkgbase=oidc-agent
pkgname=('oidc-agent')
pkgver=4.0.2
pkgrel=1
pkgdesc='A set of tools to manage OpenID Connect tokens and make them easily usable from the command line'
arch=('x86_64')
license=('MIT')
url='https://github.com/indigo-dc/oidc-agent'
makedepends=('help2man'
             'libcurl-openssl-1.0'
             'libsodium'
             'libmicrohttpd'
             'libseccomp'
             'libsecret')
depends=('libmicrohttpd'
         'libseccomp'
         'libsecret'
         'libsodium'
         'curl')
source=(${pkgbase}-${pkgver}.tar.gz::https://github.com/indigo-dc/oidc-agent/archive/v${pkgver}.tar.gz)
sha256sums=('f5663ee868eb615c59d34fb59c3c0efb639108d7ff6fedc5a6573f09fac376b9')

build() {
  cd "$srcdir"/${pkgbase}-${pkgver}
  make
}

package() {
  cd "$srcdir"/"${pkgbase}-${pkgver}"
  make install_lib PREFIX="$pkgdir"
  make install PREFIX="$pkgdir"
  #make install BIN_PATH="${pkgdir}/usr" BIN_AFTER_INST_PATH="/usr" MAN_PATH="${pkgdir}/usr/share/man" CONFIG_PATH="${pkgdir}/etc" BASH_COMPLETION_PATH="${pkgdir}/usr/share/bash-completion/completions" LIB_PATH="${pkgdir}/usr/lib64" DESKTOP_APPLICATION_PATH="${pkgdir}/usr/share/applications" XSESSION_PATH="${pkgdir}/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
