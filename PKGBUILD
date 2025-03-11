# Maintainer: SummerElement <Dapugongying@foxmail.com>
pkgname=scholaread-bin
pkgver=1.1.36
pkgrel=2
pkgdesc="A helpful AI driven software that helps you do research."
arch=('x86_64')
url="https://scholaread.com"
license=('custom')
depends=('gtk3' 'nss' 'libxss' 'libxtst')
source=("${pkgname}-${pkgver}.deb::https://cdn.scholaread.com/assets/pc-releases/${pkgver}/com/Scholaread-linux-amd64-${pkgver}.deb")
sha256sums=('SKIP')

package() {
    # unzip DEB
    ar x "${srcdir}/${pkgname}-${pkgver}.deb"
    tar -xf data.tar.xz -C "${pkgdir}"

    # fix file permission
    chmod +x "${pkgdir}/opt/Scholaread/scholaread"
    chmod 4755 "${pkgdir}/opt/Scholaread/chrome-sandbox"

    # setup license
    install -Dm644 "${pkgdir}/opt/Scholaread/LICENSE.electron.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

post_install() {
    # update icon cache
    update-desktop-database
    gtk-update-icon-cache -qt /usr/share/icons/hicolor
}

post_upgrade() {
    post_install
}

post_remove() {
    post_install
}
