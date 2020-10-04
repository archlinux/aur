# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='appimagetool'
pkgname="${_pkgname}-bin"
pkgver=12
pkgrel=1
pkgdesc='Package desktop applications as AppImages'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/AppImage/AppImageKit'
license=('MIT')
depends=('libappimage')
provides=("${_pkgname}")
noextract=("${_pkgname}")

source=("${_pkgname}-${pkgver}-README.md::${url}/raw/${pkgver}/README.md"
        "${_pkgname}-${pkgver}-LICENSE::${url}/raw/${pkgver}/LICENSE")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.appimage::${url}/releases/download/${pkgver}/${_pkgname}-x86_64.AppImage")
source_armv7h=("${_pkgname}-${pkgver}-armv7.appimage::${url}/releases/download/${pkgver}/${_pkgname}-armhf.AppImage")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.appimage::${url}/releases/download/${pkgver}/${_pkgname}-aarch64.AppImage")

sha256sums=('e7396f995fed233e08063a5bec8f26c343d7f1038f0fca80c3cad26d74090255'
            'b54da09f0d48f1c42a1b27035711ed41494551ed8a20b991746e669e6f944a94')
sha256sums_x86_64=('d918b4df547b388ef253f3c9e7f6529ca81a885395c31f619d9aaf7030499a13')
sha256sums_armv7h=('8bca91ae4dac9a6505a4939f29ce5c75b74a8c8e80d56f738b17863fbd6d2770')
sha256sums_aarch64=('c9d058310a4e04b9fbbd81340fff2b5fb44943a630b31881e321719f271bd41a')

prepare() {
  chmod a+x "${_pkgname}-${pkgver}-${CARCH}.appimage"
  ./"${_pkgname}-${pkgver}-${CARCH}.appimage" --appimage-extract
}

package(){
  install -Dm755 -t "${pkgdir}/usr/bin" "squashfs-root/usr/bin/${_pkgname}"
  install -Dm755 -t "${pkgdir}/usr/lib/appimagekit" "squashfs-root/usr/lib/appimagekit/mksquashfs"
  install -Dm644 "${_pkgname}-${pkgver}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "${_pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
