# Maintainer: NihilDigit <starse.nd233@gmail.com>

pkgname=libcurl-impersonate-bin
pkgver=1.2.5
pkgrel=1
pkgdesc='libcurl-impersonate prebuilt libraries'
arch=('x86_64')
url='https://github.com/lexiforest/curl-impersonate'
license=('MIT')
provides=('libcurl-impersonate')
conflicts=('libcurl-impersonate')
source=("https://github.com/lexiforest/curl-impersonate/releases/download/v${pkgver}/libcurl-impersonate-v${pkgver}.x86_64-linux-gnu.tar.gz")
sha256sums=('e2f08198cd7a7cd873ff7138cd50e2fc5b96fe750d1504b66ccbfae49f46bf7c')

package() {
  install -d "${pkgdir}/usr/lib"
  for file in "${srcdir}"/libcurl-impersonate.so*; do
    [ -e "$file" ] || continue
    install -Dm755 "$file" "${pkgdir}/usr/lib/$(basename "$file")"
  done

  if [[ -f "${pkgdir}/usr/lib/libcurl-impersonate.so.4.8.0" ]]; then
    ln -sf libcurl-impersonate.so.4.8.0 "${pkgdir}/usr/lib/libcurl-impersonate.so.4"
    ln -sf libcurl-impersonate.so.4.8.0 "${pkgdir}/usr/lib/libcurl-impersonate.so"
  elif [[ -f "${pkgdir}/usr/lib/libcurl-impersonate.so.4" ]]; then
    ln -sf libcurl-impersonate.so.4 "${pkgdir}/usr/lib/libcurl-impersonate.so"
  fi
}
