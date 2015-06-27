# Maintainer: Michiel <code[at]m01[dot]eu>
pkgname=lispmob
pkgver=0.4.1
pkgrel=1
pkgdesc="Locator/ID Separation Protocol (LISP) and LISP Mobile Node implementation"
url="http://lispmob.org"
arch=('x86_64' 'i686' 'armv6h')
license=('GPL2')
depends=('openssl' 'confuse' 'libcap')
provides=('lispd-systemd-unit')
optdepends=()
makedepends=('git' 'gengetopt')
conflicts=()
replaces=()
backup=("etc/lispd.conf")
install='lispmob.install'
source=("$pkgname"::"git://github.com/LISPmob/lispmob.git#tag=${pkgver}"
        "lispd.service")
md5sums=('SKIP'
         'cbb2f15b491945face7a7052c0e92d31')
sha512sums=('SKIP'
            '0c22467f626e2146fafe0901e3570e3b7780901a02183cda3403de5a9ab236dde8e5f96f5f194a2bc683cfbb78325a14e7408aa7a710698d9ace61178454ffec')

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

