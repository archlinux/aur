# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

_pkgname="rbspy"
pkgname="${_pkgname}-bin"
pkgver=0.27.0
pkgrel=1
pkgdesc="Sampling profiler for Ruby"
arch=('x86_64' 'aarch64' 'i686' 'armv7h')
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
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-i686-unknown-linux-musl.tar.gz")
source_armv7h=("${_pkgsrc}-armv7h.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-armv7-unknown-linux-musleabihf.tar.gz")
sha256sums=('2f7b5020c7b8023d6edbeccc19f3e3cb86ffcdd4055ebd87adc2f29a9e2ae902'
            '5705baf37fec97f83ce5e9624118a3479c4b1ed15f56e168c7f020700331a5df')
sha256sums_x86_64=('e931d1ee347986fb7ba373feacdf2d5013c82799b923a0df77f28421d9878fdd')
sha256sums_aarch64=('86419e6dd98ab3286a4f9ade23cc63df895f9bf083612481d9b4ee5de8916297')
sha256sums_i686=('1ffe47cffdd35b7269cff53d2d03f0025ea5d582fc702f49123294f34b619374')
sha256sums_armv7h=('f63caf3354e2568218b33865539cd5964c8652e8a638584bd933167e77a19fad')

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
