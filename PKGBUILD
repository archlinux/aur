# Maintainer: Roman Alenichev (vicimpa@ya.ru)

pkgname=chatrullete-plus
pkgver=0.0.2
pkgrel=1
pkgdesc="ChatRullete (Plus)"
arch=('x86_64')
url="https://github.com/chatrullete-plus"
license=('custom')
depends=('libnotify' 'libxss' 'nspr' 'nss' 'gtk3' 'opera-ffmpeg-codecs' 'libegl' 'libgles')
optdepends=('gnome-keyring')
source=("chatrullete-${pkgver}-${pkgrel}.tar.gz::https://github.com/vicimpa/chatrullete-plus/releases/download/0.0.1/ChatRullete-linux-0.0.1.tar.gz")
sha256sums=('a166184a809fe48df21d66371b005e2bd9017ed54e8c86ac0734b56728d7d29b')

package() {
    # Creating directory structure
    mkdir -p "${pkgdir}/usr/lib/chatrullete"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/applications"
    mkdir -p "${pkgdir}/usr/share/pixmaps"

    mv "${srcdir}/"* "${pkgdir}/usr/lib/chatrullete"
    mv "${pkgdir}/usr/lib/chatrullete/ChatRullete" "${pkgdir}/usr/lib/chatrullete/chatrullete"

    # Create symlink to executable
    ln -s "${pkgdir}/usr/lib/chatrullete" "${pkgdir}/usr/bin/chatrullete"

    # Copy resources
    cp "${startdir}/chatrullete.desktop" "${pkgdir}/usr/share/applications"
    cp "${startdir}/icon.png" "${pkgdir}/usr/share/pixmaps/chatrullete.png"

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +
}