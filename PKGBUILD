# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Maintainer: pikakolendo <pikakolendo02 at g-m-a-i-1 dot c0m>

_pkgname='appimagetool'
pkgname="${_pkgname}-bin"
pkgver=13
pkgrel=0
pkgdesc='Package desktop applications as AppImages'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/AppImage/AppImageKit'
license=('MIT')
depends=('libappimage')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
noextract=("${_pkgname}-${pkgver}-x86_64.appimage"
          "${_pkgname}-${pkgver}-armv7.appimage"
          "${_pkgname}-${pkgver}-aarch64.appimage")

source=("${_pkgname}-${pkgver}-README.md::${url}/raw/${pkgver}/README.md"
        "${_pkgname}-${pkgver}-LICENSE::${url}/raw/${pkgver}/LICENSE")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.appimage::${url}/releases/download/${pkgver}/${_pkgname}-x86_64.AppImage")
source_armv7h=("${_pkgname}-${pkgver}-armv7.appimage::${url}/releases/download/${pkgver}/${_pkgname}-armhf.AppImage")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.appimage::${url}/releases/download/${pkgver}/${_pkgname}-aarch64.AppImage")

sha256sums=('bf014bb030e26169da2129cb51e75ecc0c1a94cb2c970ee99050c65eaad16a09'
            '9cb22a08334c3a108ec4da96c1d6aea7a17a732fa9f5ca3413a9b4ce651397d8')
sha256sums_x86_64=('df3baf5ca5facbecfc2f3fa6713c29ab9cefa8fd8c1eac5d283b79cab33e4acb')
sha256sums_armv7h=('36bb718f32002357375d77b082c264baba2a2dcf44ed1a27d51dbb528fbb60f6')
sha256sums_aarch64=('334e77beb67fc1e71856c29d5f3f324ca77b0fde7a840fdd14bd3b88c25c341f')

prepare() {
  chmod a+x "${_pkgname}-${pkgver}-${CARCH}.appimage"
  ./"${_pkgname}-${pkgver}-${CARCH}.appimage" --appimage-extract
}

package(){
  install -Dvm755 "squashfs-root/usr/bin/${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm755 "squashfs-root/usr/lib/appimagekit/mksquashfs" -t "${pkgdir}/usr/lib/appimagekit"
  install -Dvm644 "${_pkgname}-${pkgver}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dvm644 "${_pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

