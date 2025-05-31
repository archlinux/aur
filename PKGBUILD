# Maintainer: Eren Simsek <18117384-caferen@users.noreply.gitlab.com>
# Contributor: Guy Boldon <gb@guyboldon.com>

pkgname=coolercontrol-bin
_pkgname=${pkgname%-bin}
_app_id="org.$_pkgname.CoolerControl"
pkgver=2.2.0
pkgrel=1
pkgdesc="A program to monitor and control your cooling devices (binary release)"
arch=('x86_64')
url="https://gitlab.com/coolercontrol/coolercontrol"
license=('GPL-3.0-or-later')
depends=(
  'gtk3'
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
  "https://gitlab.com/coolercontrol/coolercontrol/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz"
)
sha256sums=(
  '3a0da6c133c71da8720ef1836e9e6987cbdb64f89a4fa289ee66372ee6c60fe1'
  '89057c77bbe7ae2c0523578a5a6e408d5af033c432aa9b9f810c256ec7e39f9e'
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
  install -Dm644 "packaging/metadata/$_app_id.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 "packaging/metadata/$_app_id.png" -t "$pkgdir/usr/share/pixmaps/"
  install -Dm644 "packaging/metadata/$_app_id.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm644 "packaging/metadata/${_app_id}-symbolic.svg" -t "$pkgdir/usr/share/icons/hicolor/symbolic/apps/"

  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
}
