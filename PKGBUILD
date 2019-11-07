# Maintainer: Lenovsky <lenovsky@pm.me>
# Contributor: aimileus <me at aimileus dot nl>

pkgname=protonmail-bridge
pkgver=1.2.3
pkgrel=1
pkgdesc="Integrate ProtonMail paid account with any program that supports IMAP and SMTP"
arch=('x86_64')
url="https://www.protonmail.com/bridge"
license=('MIT')
depends=('hicolor-icon-theme' 'libsecret' 'qt5-multimedia' 'ttf-dejavu')
optdepends=(
    'gnome-keyring: supported password manager (password manager is required)'
    'pass: supported password manager (password manager is required)'
)
options=('!emptydirs' '!strip')
source=("https://protonmail.com/download/protonmail-bridge_${pkgver}-${pkgrel}_amd64.deb")
sha256sums=('815b1b8b56d174fd4f6ce1d898e77de8f90b01e49fff89f57229b4edd27c4f0c')

prepare() {
    tar xf data.tar.xz

    mkdir -p usr/share/icons/hicolor/scalable/apps
    mv usr/share/icons/protonmail/ProtonMail_Bridge.svg \
        usr/share/icons/hicolor/scalable/apps/"${pkgname}".svg

    mv usr/share/applications/ProtonMail_Bridge.desktop \
        usr/share/applications/"${pkgname}".desktop
    sed -i "s|Icon=.*|Icon=protonmail-bridge|" \
        usr/share/applications/"${pkgname}".desktop
}

package() {
    mv usr/ "${pkgdir}"

    install -D -m644 "${pkgdir}"/usr/lib/protonmail/bridge/{eula.txt,LICENSE} \
        -t "${pkgdir}"/usr/share/licenses/"${pkgname}"
}
