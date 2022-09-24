# Maintainer: Adrià Cabello <adro.cc79 at protonmail dot com>
pkgname=nvidia-omniverse
pkgver=1.5.7
pkgrel=1
pkgdesc="The platform for creating and operating metaverse applications."
arch=('x86_64')
url="https://www.nvidia.com/omniverse/"
license=('Custom: Nvidia')
provides=('omniverse')
depends=("electron" "nvidia")
source=("https://install.launcher.omniverse.nvidia.com/installers/$provides-launcher-linux.AppImage")
noextract=("$provides-launcher-linux.AppImage")
md5sums+=('7313eccc5d5abeefca00678427ed261c')
options=('!strip')

prepare() {
  cd "${srcdir}"
  chmod +x "$provides-launcher-linux.AppImage"
}

package() {
    install -dm0755 "${pkgdir}/opt"
    mkdir -p "${pkgdir}/usr/bin"

    ./$provides-launcher-linux.AppImage --appimage-extract

    mv squashfs-root "${pkgdir}/opt/$provides"

    chmod 755 -R ${pkgdir}/opt/$provides

    ln -s "/opt/$provides/$provides-launcher" "${pkgdir}/usr/bin/$provides"

}
