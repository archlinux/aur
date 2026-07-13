# Maintainer: NihilDigit <starse.nd233@gmail.com>

pkgname=libcurl-impersonate-bin
pkgver=1.5.6
pkgrel=1
pkgdesc='libcurl-impersonate prebuilt libraries'
arch=('x86_64')
url='https://github.com/lexiforest/curl-impersonate'
license=('MIT')
depends=('glibc')
provides=('libcurl-impersonate')
conflicts=('libcurl-impersonate')
source=("https://github.com/lexiforest/curl-impersonate/releases/download/v${pkgver}/libcurl-impersonate-v${pkgver}.${CARCH}-linux-gnu.tar.gz"
        "curl-impersonate-LICENSE-${pkgver}::https://raw.githubusercontent.com/lexiforest/curl-impersonate/v${pkgver}/LICENSE")
sha256sums=('f07e25084020c54d6fd5654c8d458e09b3a44c312f88e480c255399f00487b25'
            '7d0c5f4b5b4c27299ad6759798772b866b3559ac5edb23845f36328eb734376d')

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

  install -Dm644 "${srcdir}/curl-impersonate-LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
