# Maintainer: Michiel <code[at]m01[dot]eu>
pkgname=lispmob
pkgver=0.5.2.1
pkgrel=1
pkgdesc="Locator/ID Separation Protocol (LISP) and LISP Mobile Node implementation"
url="http://lispmob.org"
arch=('x86_64' 'i686' 'armv6h')
license=('GPL2')
depends=('openssl' 'confuse' 'libcap')
makedepends=('git' 'gengetopt')
backup=("etc/lispd.conf")
source=("git+https://github.com/LISPmob/lispmob.git#tag=${pkgver}"
        "lispd.service")
sha256sums=('SKIP'
            'dcad9ed9b3f643794c5021d4cbddf4fa0ba99177465394ecdcf943fcf8019520')

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make PREFIX="/usr/bin/" DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "${srcdir}/lispd.service" "$pkgdir/etc/systemd/system/lispd.service"
  install -Dm644 "${srcdir}/${pkgname}/lispd/lispd.conf.example" "$pkgdir/etc/lispd.conf"
}

# vim:set ts=2 sw=2 et:
