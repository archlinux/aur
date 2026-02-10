# Maintainer: cloudwithax <heyimnick14@gmail.com>
pkgname=rootchat-bin
pkgver=0.9.84
pkgrel=1
pkgdesc="A community platform combining chat with task management, raid planning, and customizable apps"
arch=('x86_64')
url="https://rootapp.com"
license=('custom')
depends=('zlib' 'gcc-libs' 'glibc' 'fuse2')
provides=('rootchat')
conflicts=('rootchat')
options=('!strip' '!debug')
source=("Root-${pkgver}.AppImage::https://installer.rootapp.com/installer/Linux/X64/Root.AppImage")
sha256sums=('06a5564ccaaf38eab76f6a3a0e49cca2db822028a1d1a7be2dafd9a8f47bf4f9')
noextract=("Root-${pkgver}.AppImage")

prepare() {
    chmod +x "${srcdir}/Root-${pkgver}.AppImage"
    "${srcdir}/Root-${pkgver}.AppImage" --appimage-extract
}

package() {
    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/squashfs-root/usr/bin/"* "${pkgdir}/opt/${pkgname}/"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/Root" "${pkgdir}/usr/bin/rootchat"

    install -Dm644 "${srcdir}/squashfs-root/Root.png" "${pkgdir}/usr/share/pixmaps/rootchat.png"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/rootchat.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Root
Comment=Community platform combining chat with task management and customizable apps
Exec=rootchat
Icon=rootchat
Terminal=false
StartupWMClass=Root
Categories=Network;InstantMessaging;
EOF
}
