# Maintainer: Nemo <archlinux at captnemo dot in>

# PRs are welcome at: https://github.com/captn3m0/aur-pop-bin

pkgname=pop-bin
pkgver=6.0.6
pkgrel=1
pkgdesc="Low latency videoconferencing & screen sharing with multiplayer drawing & control. Pop is a multiplayer screen sharing app that lets you work together like you’re in the same room."
arch=('x86_64')
url="https://pop.com"
depends=('alsa-lib' 'atk' 'at-spi2-atk' 'at-spi2-core' 'cairo' 'dbus' 'desktop-file-utils' 'expat' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme'  'libcups' 'libnotify' 'libutil-linux' 'libx11' 'libxcb' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxrandr' 'libxrender' 'libxss' 'libxtst' 'nspr' 'nss' 'pango'  'xpra')
optdepends=('apparmor'
            'libgnome-keyring'
            'pulseaudio'
            'kde-cli-tools'
            'trash-cli'
            'xdg-utils'
            'libappindicator-gtk3')
license=('custom')
options=('!strip' '!emptydirs')
replaces=('screen-desktop-bin')
conflicts=('screen-desktop-bin')
source=("https://download.pop.com/desktop-app/linux/${pkgver}/pop_${pkgver}_amd64.deb")
sha512sums=('d17799b63f7e040bbd06d46504c47c82b805c8d89e93f7272afc89c916ecdb8726067859b19321f565a61a259e41bac6e8c3a4e76959728d23ea2bbf1b2c75b2')

package(){
    mkdir -p "${pkgdir}/opt/${pkgname}"
    tar xf data.tar.xz
    cp -r usr/lib/pop/* "${pkgdir}/opt/${pkgname}"

    install -dm755 "$pkgdir"/usr/bin
    ln -s /opt/"$pkgname"/Pop "$pkgdir/usr/bin/pop"

    install -D -m644 "usr/share/applications/pop.desktop" "${pkgdir}/usr/share/applications/pop.desktop"
    install -D -m644 "usr/share/pixmaps/pop.png" "${pkgdir}/usr/share/pixmaps/pop.png"
    install -D -m644 "usr/share/doc/pop/copyright" "${pkgdir}/usr/share/doc/${pkgname}/COPYRIGHT"
    install -D -m644 "usr/lib/pop/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/chromium.LICENSE"
}
