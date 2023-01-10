# Maintainer: Adrià Cabello <adro.cc79 at protonmail dot com>
pkgname=nvidia-omniverse
pkgver=1.8.2.1843
pkgrel=1
pkgdesc="The platform for creating and operating metaverse applications."
arch=('x86_64')
url="https://www.nvidia.com/omniverse/"
license=('Custom: Nvidia')
provides=('omniverse')
depends=("electron" "nvidia")
source=("https://install.launcher.omniverse.nvidia.com/installers/$provides-launcher-linux.AppImage")
noextract=("$provides-launcher-linux.AppImage")
md5sums=('b34cc9083caa7827cc25e9b5041452d8')
options=('!strip')

prepare() {
  cd "${srcdir}"
  chmod +x "$provides-launcher-linux.AppImage"
}

package() {
    install -dm0755 "${pkgdir}/opt"

    ./$provides-launcher-linux.AppImage --appimage-extract

    mv squashfs-root "${pkgdir}/opt/$provides"

    mv "${pkgdir}/opt/$provides/usr" "${pkgdir}/usr"

    mkdir -p "${pkgdir}/usr/bin"

    chmod 755 -R ${pkgdir}/opt/$provides

    ln -s "/opt/$provides/$provides-launcher" "${pkgdir}/usr/bin/$provides"

}
