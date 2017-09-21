# Maintainer: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>
# Please report issues at https://github.com/jojosch/pkgbuilds

pkgname='testssl.sh'
pkgver=2.9.5.1
_pkgver=2.9.5-1
pkgrel=1
pkgdesc="Testing TLS/SSL encryption"
arch=('any')
url="https://github.com/drwetter/testssl.sh"
license=("GPL")
depends=('bash' 'coreutils' 'util-linux' 'openssl')
source=(
  "https://github.com/drwetter/testssl.sh/archive/v${_pkgver}.tar.gz"
  "set-install-dir.patch"
)
sha256sums=(
  '505ba9400e1a49759ba84d0cf6ae79f3787f111c64a319094de69635b786c72a'
  '896d9867cd816b706ca6170fea07285e6daee5ff7bfc246a8ee9a7f682dcbdeb'
)

prepare() {
  cd "${srcdir}/${pkgname}-${_pkgver}"

  patch < "../set-install-dir.patch"
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}"

  install -D -m755 "testssl.sh" "${pkgdir}/usr/bin/testssl.sh"

  mkdir -p "${pkgdir}/usr/share/testssl.sh"
  cp -a etc "${pkgdir}/usr/share/testssl.sh/etc"
}
