# Maintainer: christooss <christooss@gmail.com>

_pkgname=median-xl-launcher
pkgname=median-xl-launcher-appimage
pkgver=1.4.0
pkgrel=1
pkgdesc="Launcher for Median XL mod, a Diablo II overhaul modification"
arch=("x86_64")
url="https://www.median-xl.com/"
license=("unknown")
depends=('fuse2')
noextract=("medianxl-x86_64.AppImage")
provides=("median-xl-launcher")
options=(!strip)
source=("https://get.median-xl.com/launcher/linux/medianxl-x86_64.AppImage"
	${_pkgname}.sh)
sha256sums=("2380ce0fef3eae9798b70b9e2d5d02b366b3d08184563284c5e12f4107ee526c"
	    "084166d2d19d609e77d37de81adf03889f05f352255a130e042640c4d283aeb4")

prepare() {
    cd "${srcdir}"
    chmod +x "medianxl-x86_64.AppImage"
    ${srcdir}/medianxl-x86_64.AppImage --appimage-extract
}

package() {
  install -Dm755 "${srcdir}/medianxl-x86_64.AppImage" "${pkgdir}/opt/appimages/medianxl-x86_64.AppImage"
  install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
  
  install -dm755 "${pkgdir}/usr/share/"  
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
  install -Dm644 "${srcdir}/squashfs-root/medianxllauncher.desktop" "${pkgdir}/usr/share/applications/medianxllauncher.desktop"

}


