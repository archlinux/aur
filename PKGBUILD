# Maintainer:  <cradlemann@gmail.com>
pkgname=hfdownloader
pkgver=3.4.0
pkgrel=2
pkgdesc="Simple go utility to download HuggingFace Models and Datasets"
arch=('x86_64' 'aarch64')
url="https://github.com/bodaay/HuggingFaceModelDownloader"
license=('Apache 2.0')
depends=('glibc')
provides=("${pkgname}")
conflicts=('hfdownloader-git')
_tag="v${pkgver}"

# Upstream ships prebuilt Go binaries per architecture, so nothing is compiled
# here. Only x86_64 and aarch64 are published.
case "${CARCH}" in
    x86_64)  _goarch='amd64' ;;
    aarch64) _goarch='arm64' ;;
esac
_gobin="${pkgname}-linux-${_goarch}-${_tag}"

# The binary is not an archive: makepkg downloads it as-is, no extraction.
source=("LICENSE::${url}/raw/${_tag}/LICENSE")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
source_x86_64=("${_gobin}::${url}/releases/download/${_tag}/hfdownloader_linux_amd64_${_tag}")
sha256sums_x86_64=('0a184de0c5d6bac1f68cb7dace778193e08aea3991f698e2f823700e70dd4409')
source_aarch64=("${_gobin}::${url}/releases/download/${_tag}/hfdownloader_linux_arm64_${_tag}")
sha256sums_aarch64=('ba8dbe423824281aaf6ba688973619de1c08aba76d2c5243cb0ae848a7ee4978')

package() {
    install -Dm755 "${srcdir}/${_gobin}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
