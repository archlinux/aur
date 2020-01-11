# Maintainer: Yurii <yu hrysh at proton mail dot com>

pkgname=chromium-extension-adnauseam
pkgver=3.9.102
pkgrel=1
pkgdesc='An ad-blocker which silently simulates clicks on each blocked ad, confusing trackers'
arch=('any')
url='https://adnauseam.io'
license=('GPL3')
makedepends=('zip' 'grep' 'curl')
optdepends=("chromium: open-source web browser from Google"
            "google-chrome: Google's freeware web browser")
install=${pkgname}.install
source=("https://github.com/dhowe/AdNauseam/releases/download/v${pkgver}/adnauseam-${pkgver}.chromium.zip")

pkgver() {
   # Automatically get latest release version because I'm too lazy to properly maintain this
   # This URL redirects you to https://github.com/dhowe/AdNauseam/releases/tag/v%LATEST_VERSION
   curl https://github.com/dhowe/AdNauseam/releases/latest --silent --location --head --output /dev/null --write-out '%{url_effective}' | grep '\d+(\.\d+)*' --perl-regexp --only-matching
}

package() {
   mkdir -p "${pkgdir}/usr/share/${pkgname}"
   cp -dr --no-preserve=ownership "${srcdir}/adnauseam.chromium"/* "${pkgdir}/usr/share/${pkgname}/"
}
sha256sums=('SKIP')
