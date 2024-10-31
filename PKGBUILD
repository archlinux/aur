# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

_pkgname="rbspy"
pkgname="${_pkgname}-bin"
pkgver=0.26.0
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
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${_url}/raw/v${pkgver}/README.md"
        "LICENSE-${pkgver}.md::${_url}/raw/v${pkgver}/License.md")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-i686-unknown-linux-musl.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.tar.gz")
source_armv7h=("${_pkgsrc}-armv7h.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-armv7-unknown-linux-musleabihf.tar.gz")
sha256sums=('2f7b5020c7b8023d6edbeccc19f3e3cb86ffcdd4055ebd87adc2f29a9e2ae902'
            '5705baf37fec97f83ce5e9624118a3479c4b1ed15f56e168c7f020700331a5df')
sha256sums_x86_64=('ff43f5747e3c531bffad7bbfed68f6c83a9ffacf69811123893a74987f151178')
sha256sums_i686=('2e7fb353c2f6f7ad8a92b5722a6a873608625d6a9472a0379e70f1aaba3e1718')
sha256sums_aarch64=('9c1ad934a32e4777ed8b1afe3e717bc003a0584007c1d766fa9e5517672301ba')
sha256sums_armv7h=('4708e600ce0bd514ff433638a0363187d5183f4e3eea18a1ff26484ab1e33093')

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
  install -Dm644 "README-${pkgver}.md"    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}.md"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
