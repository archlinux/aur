# Maintainer: awumii <awumii@protonmail.com>

pkgname=zerotier-desktop-ui
pkgver=1.8.4.r70.g910e6d3
pkgrel=1
pkgdesc='Official ZeroTier Desktop Tray Application and UI'
url='https://github.com/zerotier/DesktopUI'
source=("${pkgname}::git+https://github.com/zerotier/DesktopUI.git")
arch=('any')
license=('MPL2')
makedepends=('rust' 'meson')
depends=('zerotier-one' 'libappindicator-gtk3' 'gtk3' 'glib2')
sha256sums=(SKIP)

build () {
  cd ${pkgname}
  make official
}

package() {
  cd ${pkgname}
  install -Dm755 target/release/zerotier_desktop_ui "${pkgdir}/usr/bin/zerotier_desktop_ui"
  install -Dm644 zerotier-ui.desktop "${pkgdir}/usr/share/applications/zerotier-ui.desktop"
  install -Dm644 ZeroTierIcon.png "${pkgdir}/usr/share/zerotier/ZeroTierIcon.png"
}

pkgver() {
    cd ${pkgname}
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
