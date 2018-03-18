# Maintainer : Sebastian Lau <lauseb644 _at_ gmail .dot. com>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Liganic <liganic-aur@gmx.org>
# Contributor: Bernd Amend <berndamend@web.de>
# Contributor: Holodoc <archlinux@bananapro.de>

pkgname=giteye
pkgver=2.1.0
pkgrel=4
pkgdesc="CollabNet GitEye is a desktop for Git. It works with TeamForge, CloudForge and other Git services."
arch=('x86_64')
url="https://www.collab.net/products/giteye"
license=('custom')
depends=('git' 'jdk8-openjdk' 'python')
makedepends=('unzip')
options=('!strip')
source=("LICENSE"
        "${pkgname}.desktop"
        "https://downloads-guests.open.collab.net/files/documents/61/18801/GitEye-${pkgver}-linux.x86_64.zip")
md5sums=('78ba2a04c6b766a778681705d40abbb4'
         '49ac32371bce35a3fb1494be3bd595b7'
         '3734ec716b426095d09d1d131066d028')
noextract=(*.zip) # extract nothing


package() {
    cd "${srcdir}"

    msg2 "Extracting GitEye from archive..."
    install -Ddm755 "${pkgdir}/opt/${pkgname}/"
    install -Ddm755 "${pkgdir}/usr/bin/"

    unzip -q "GitEye-${pkgver}-linux.x86_64.zip" -d "${pkgdir}/opt/${pkgname}/"

    msg2 "Installing LICENSE..."
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    msg2 "Installing desktop file and icon..."
    install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname}/icon.xpm" "${pkgdir}/usr/share/pixmaps/${pkgname}.xpm"
}
