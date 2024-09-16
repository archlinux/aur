# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

_pkgname="rbspy"
pkgname="${_pkgname}-bin"
pkgver=0.25.0
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
sha256sums_x86_64=('3c782921c0890dc9ae8c15fc7ea1709ec9bb0fc31dc9448fbe482296e2d816c4')
sha256sums_i686=('7fd4341b459fd2f6681bfb2bbc2c81de9b79db357a54fa2b41836af4d8a87483')
sha256sums_aarch64=('2db68d76b55b0c4a8f7772378929b339df5d1d92c9c360dfeb86c683a903a095')
sha256sums_armv7h=('064caca275e7ca6890119fba448a9e718ed86d382724531890a865932dba06a2')

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
