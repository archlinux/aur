# Maintainer: awumii <awumii@protonmail.com>

pkgname=zerotier-desktop-ui-git
pkgver=1.8.4.r103.gb2a7a30
pkgrel=1
pkgdesc='Official ZeroTier Desktop Tray Application and UI'
url='https://github.com/zerotier/DesktopUI'
source=('git+https://github.com/zerotier/DesktopUI.git')
arch=('any')
license=('MPL2')
makedepends=('rust' 'meson' 'git')
depends=('zerotier-one' 'libayatana-appindicator' 'libappindicator-gtk3' 'gtk3' 'glib2')
conflicts=('zerotier-desktop-ui')
sha256sums=(SKIP)
options=(!lto)

build () {
  cd DesktopUI
  make official
}

package() {
  cd DesktopUI
  install -Dm755 target/release/zerotier_desktop_ui "${pkgdir}/usr/bin/zerotier_desktop_ui"
  install -Dm644 zerotier-ui.desktop "${pkgdir}/usr/share/applications/zerotier-ui.desktop"
  install -Dm644 ZeroTierIcon.png "${pkgdir}/usr/share/zerotier/ZeroTierIcon.png"
}

pkgver() {
    cd DesktopUI
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
