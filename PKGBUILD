# Maintainer: Almir Dzinovic <almir@dzinovic.net>
# Contributor: Alexander Pavel <alexpavel123@gmail.com>

pkgname=mattermost-desktop-bin
pkgver=3.7.0
pkgrel=2
pkgdesc="Mattermost Desktop (Beta) for Linux (binary)"
arch=('x86_64')

url="https://github.com/mattermost/desktop"
license=('Apache')

makedepends=()
depends=('gtk2' 'libxtst' 'libxss' 'gconf' 'nss' 'nspr' 'alsa-lib')
optdepends=()

conflicts=('mattermost-desktop')

install=$pkgname.install

sha512sums=('f46f13045850579c49a87ab2a01caf3c3d95ac6bb9bc807c414413df6804ea36342bbc0a31a75d10a3b048dc3ac5a3efe8c26883c0705aec8875900366b9b58a'
            '04be6f1eec98bf22480bd4c354f25dcd640512a31592d55df6592bdefa8e1c8f8c87e0ca0c94db9f66193e8c674e7c75b5b207fe6dbbcf671a35004c855e64a4')
source=("https://releases.mattermost.com/desktop/${pkgver}/mattermost-desktop-${pkgver}-linux-x64.tar.gz"
         mattermost-desktop.desktop)

package() {
    cd "${srcdir}/mattermost-desktop-${pkgver}"

    install -d -m 755 "${pkgdir}"/usr/lib/mattermost

    cp -r * "$pkgdir/usr/lib/mattermost"

    install -d -m 755 "$pkgdir/usr/bin"
    ln -s /usr/lib/mattermost/mattermost-desktop "$pkgdir/usr/bin/mattermost-desktop"

    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/mattermost-desktop/LICENSE"

    install -Dm644 "${srcdir}"/mattermost-desktop.desktop "$pkgdir/usr/share/applications/mattermost-desktop.desktop"
    install -Dm644 "$pkgdir/usr/lib/mattermost/icon.png" "$pkgdir/usr/share/pixmaps/mattermost-desktop.png"
}
