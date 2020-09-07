# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='appimagetool'
pkgname="${_pkgname}-bin"
pkgver=12
pkgrel=1
pkgdesc='Package desktop applications as AppImages'
arch=('x86_64')
url='https://github.com/AppImage/AppImageKit'
license=('MIT')
depends=('libappimage')
optdepends=('zsync: binary delta updates')
provides=("${_pkgname}")
noextract=("${_pkgname}")
source=("${_pkgname}-${pkgver}.appimage::${url}/releases/download/${pkgver}/${_pkgname}-x86_64.appimage"
        "${_pkgname}-${pkgver}-README.md::${url}/raw/${pkgver}/README.md"
        "${_pkgname}-${pkgver}-LICENSE::${url}/raw/${pkgver}/LICENSE")
sha256sums=('d918b4df547b388ef253f3c9e7f6529ca81a885395c31f619d9aaf7030499a13'
            'e7396f995fed233e08063a5bec8f26c343d7f1038f0fca80c3cad26d74090255'
            'b54da09f0d48f1c42a1b27035711ed41494551ed8a20b991746e669e6f944a94')

build() {
  chmod a+x "${_pkgname}-${pkgver}.appimage"
  ./"${_pkgname}-${pkgver}.appimage" --appimage-extract
}

package(){
  install -Dm755 -t "${pkgdir}/usr/bin" "squashfs-root/usr/bin/${_pkgname}"
  install -Dm755 -t "${pkgdir}/usr/lib/appimagekit" "squashfs-root/usr/lib/appimagekit/mksquashfs"
  install -Dm644 "${_pkgname}-${pkgver}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "${_pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
