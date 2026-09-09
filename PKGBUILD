# Maintainer: Eren Simsek <18117384-caferen@users.noreply.gitlab.com>
# Contributor: Guy Boldon <gb@guyboldon.com>

pkgname=coolercontrol-bin
_pkgname=${pkgname%-bin}
_app_id="org.$_pkgname.CoolerControl"
pkgver=5.0.0
pkgrel=1
pkgdesc="A program to monitor and control your cooling devices (official, binary package)"
arch=('x86_64')
url="https://gitlab.com/coolercontrol/coolercontrol"
license=('GPL-3.0-or-later')
depends=(
    'hicolor-icon-theme'
    'coolercontrold-bin'
    'qt6-webengine'
)
checkdepends=(
    'appstream-glib'
    'desktop-file-utils'
)
provides=("$_pkgname")
conflicts=(
    "$_pkgname" # source package
)
groups=(coolercontrol-bin)
source=(
    "https://gitlab.com/coolercontrol/coolercontrol/-/releases/$pkgver/downloads/packages/${_pkgname}_${pkgver}"
    "https://gitlab.com/coolercontrol/coolercontrol/-/releases/$pkgver/downloads/packages/coolercontrol-$pkgver.tar.gz"
)
sha256sums=(
  '1cb14597319e72b539234c7c0fcccfb341fcea9a81df2a14aa33e4a5c7b9f96c'
  'ebdc2e5aa4d4e380d71d10c3e3d22de3f93f3b49ef78255f3183a1d734801ffe'
)

check() {
    cd "${srcdir}/$_pkgname-$pkgver"
    desktop-file-validate "packaging/metadata/$_app_id.desktop"
    appstream-util validate-relax "packaging/metadata/$_app_id.metainfo.xml"
}

package() {
    install -DTm755 "${_pkgname}_${pkgver}" "$pkgdir/usr/bin/${_pkgname}"

    cd "${srcdir}/$_pkgname-$pkgver"

    # desktop metadata
    install -Dm644 "packaging/metadata/$_app_id.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 "packaging/metadata/$_app_id.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
    install -Dm644 "packaging/metadata/$_app_id-alert.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
    install -Dm644 "packaging/metadata/${_app_id}-symbolic.svg" -t "$pkgdir/usr/share/icons/hicolor/symbolic/apps/"
    install -Dm644 "packaging/metadata/${_app_id}-symbolic-alert.svg" -t "$pkgdir/usr/share/icons/hicolor/symbolic/apps/"
    install -Dm644 "packaging/metadata/$_app_id.png" -t "$pkgdir/usr/share/pixmaps/"
    install -Dm644 "packaging/metadata/$_app_id-alert.png" -t "$pkgdir/usr/share/pixmaps/"
    install -Dm644 "packaging/metadata/$_app_id.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"

    install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$_pkgname"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
}
