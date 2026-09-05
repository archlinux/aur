# Maintainer: Eko Putra Pratama <your@email.com>
#
# WebWallpaper — KDE Plasma 6 wallpaper plugin + theme store.
# Binary package: repackages the prebuilt .deb files published on GitHub
# Releases into Arch packages (both subpackages from one PKGBUILD).

pkgname=('webwallpaper-plugin' 'webwallpaper-store')
pkgbase=webwallpaper-kde
pkgver=0.1.0
pkgrel=1
pkgdesc="Live HTML/WebGL KDE Plasma 6 wallpapers (plugin) + theme store app"
arch=('x86_64')
url="https://github.com/ekoputrapratama/webwallpaper-kde"
license=('GPL-2.0-or-later')
makedepends=('libarchive')   # provides bsdtar used to unpack the .debs
options=('!strip' '!emptydirs')

source=(
  "webwallpaper-plugin_${pkgver}_amd64.deb::https://github.com/ekoputrapratama/webwallpaper-kde/releases/download/v${pkgver}/webwallpaper-plugin_${pkgver}_amd64.deb"
  "webwallpaper-store_${pkgver}_amd64.deb::https://github.com/ekoputrapratama/webwallpaper-kde/releases/download/v${pkgver}/webwallpaper-store_${pkgver}_amd64.deb"
)
sha256sums=(
  '778085b4d8ef5cff20daeab749b9175b0560d510bc5eb1944eaf7ac7797bb59c'
  '66bbb7be44f5f524af3f383bb045146498aa9d9aabf43100805529904162082f'
)

# Extract the filesystem payload (data.tar.*) of a .deb into the target dir.
unpack_deb() {
  local deb="$1" dest="$2"
  bsdtar -xf "${deb}" -O data.tar.xz | bsdtar -xf - -C "${dest}"
}

package_webwallpaper-plugin() {
  depends=(
    'qt6-declarative'   # qml6-module-qtquick
    'qt6-webengine'     # qml6-module-qtwebengine
    'qt6-wayland'       # qml6-module-qtwaylandclient
    'kwindowsystem'     # libkf6windowsystem1
    'kwayland'          # libkf6waylandclient1
    'libplasma'         # libplasma6
  )

  unpack_deb "${srcdir}/webwallpaper-plugin_${pkgver}_amd64.deb" "${pkgdir}"
}

package_webwallpaper-store() {
  depends=(
    'qt6-base'          # libqt6core/gui/widgets/network
  )

  unpack_deb "${srcdir}/webwallpaper-store_${pkgver}_amd64.deb" "${pkgdir}"
}
