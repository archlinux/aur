# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Simon Gomizelj <simongmzlj(at)gmail(dot)com>
# Contributor: Kyle Manna <kyle(at)kylemanna(dot)com>

pkgname=slack-desktop
pkgver=2.0.1
pkgrel=1
pkgdesc="Slack Desktop (Beta) for Linux"
arch=('i686' 'x86_64')
url="https://slack.com/apps"
license=('custom')
depends=('expat' 'gconf' 'gtk2' 'gvfs' 'hunspell' 'hunspell-en' 'libgcrypt' 'libnotify' 'libxss' 'libxtst' 'xdg-utils')
optdepends=('gnome-keyring')

source_x86_64=("https://slack-ssb-updates.global.ssl.fastly.net/linux_releases/slack-desktop-${pkgver}-amd64.deb")
source_i686=("https://slack-ssb-updates.global.ssl.fastly.net/linux_releases/slack-desktop-${pkgver}-i386.deb")

sha256sums_x86_64=('12d84e61ba366cc5bac105b3f9930f2dfdd64c1e5fabbb08a6877e1c98bfb9c7')
sha256sums_i686=('22a3c30c255db31247755749a34fe2e027fd90478c023143ee9449a045ba0bb6')

package() {
    bsdtar -O -xf "slack-desktop-${pkgver}"*.deb data.tar.xz | bsdtar -C "$pkgdir" -xJf -

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +

    # Remove all unnecessary stuff
    rm -rf "${pkgdir}/etc"
    rm -rf "${pkgdir}/usr/share/lintian"
    rm -rf "${pkgdir}/usr/share/doc"

    # Move license
    install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
    mv ${pkgdir}/usr/share/slack/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
    mv ${pkgdir}/usr/share/slack/LICENSES.chromium.html ${pkgdir}/usr/share/licenses/${pkgname}
    ln -s ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE ${pkgdir}/usr/share/slack/resources/LICENSE
}
