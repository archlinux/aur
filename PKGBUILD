# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

_pkgname="rbspy"
pkgname="${_pkgname}-bin"
pkgver=0.24.0
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
sha256sums_x86_64=('4bb0b071bfcd5893c6c0a1a3ba6f1da857cdb4705c2a3b62f34b289a3e4bf1b0')
sha256sums_i686=('bfa839d8a2dda518c340384bb7fdc4e4f0200f1f65198bf0184ef1ebf9c449b2')
sha256sums_aarch64=('2c3be55ed2ea36d0c5200b646843833fa81b66727d3db3d6487d868057213b96')
sha256sums_armv7h=('cacc1a2f10904162425f1f170783b41b91dee8bfe89825c1bd6ef2be93cc8f07')

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
