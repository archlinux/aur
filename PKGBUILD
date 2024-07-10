# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

_pkgname="rbspy"
pkgname="${_pkgname}-bin"
pkgver=0.23.0
pkgrel=1
pkgdesc="Sampling profiler for Ruby"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://${_pkgname}.github.io"
_url="https://github.com/${_pkgname}/${_pkgname}"
license=('MIT')
depends=('ruby>=1.9.3')
depends_x86_64=('glibc' 'gcc-libs')
depends_aarch64=('glibc' 'gcc-libs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_url}/raw/v${pkgver}/"{"README","License"}".md")
source_x86_64=("${_url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.gz")
source_i686=("${_url}/releases/download/v${pkgver}/${_pkgname}-i686-unknown-linux-musl.tar.gz")
source_aarch64=("${_url}/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.tar.gz")
source_armv7h=("${_url}/releases/download/v${pkgver}/${_pkgname}-armv7-unknown-linux-musleabihf.tar.gz")
sha256sums=('2f7b5020c7b8023d6edbeccc19f3e3cb86ffcdd4055ebd87adc2f29a9e2ae902'
            '5705baf37fec97f83ce5e9624118a3479c4b1ed15f56e168c7f020700331a5df')
sha256sums_x86_64=('0a177c4fa49d17c86820966fd830d35006046481c5af300e601dcf1e2df40e27')
sha256sums_i686=('16665cc6f7c522e8c77015672216b8441c324df058b2ec5d5700342b332b94f5')
sha256sums_aarch64=('e323b7ccacd8faf2e970f9d5f31b336e7b3b22583ea1e799919d958e21b31233')
sha256sums_armv7h=('88efbb3fa74b9da0d9727a42a86ce20b2ef368576de4f95196702202e71f3a09')

case "${CARCH}" in
  x86_64)
    _suffix="x86_64-unknown-linux-gnu"
    ;;
  i686)
    _suffix="i686-unknown-linux-musl"
    ;;
  aarch64)
    _suffix="aarch64-unknown-linux-gnu"
    ;;
  armv7h)
    _suffix="armv7-unknown-linux-musleabihf"
    ;;
  *)
    echo "Unsupported architecture: ${CARCH}"
    exit 1
    ;;
esac

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}-${_suffix}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "License.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
