#Maintainer: Tony Fettes <feihaoxiang2014@gmail.com>

pkgname=moe-kde-git
_gitname=moe-theme
pkgver=r11.b58cecf
pkgrel=1
pkgdesc='A Light theme, with blur transparencies and red tones with gradients for KDE'
arch=('any')
url='https://gitlab.com/jomada/moe-theme'
license=('GPL3')
optdepends=('plasma-desktop: for a plasma desktop theme'
            'kvantum-qt5: for a Kvantum theme'
            'latte-dock-git: for a Latte dock layout'
            'plasma5-applets-virtual-desktop-bar-git: for Latte dock'
            'plasma5-applets-latte-sidebar-button: for Latte dock'
            'plasma5-applets-window-title: for Latte dock'
            'plasma5-applets-latte-separator: for Latte dock'
            'plasma5-applets-window-buttons: for Latte dock'
            'plasma5-applets-betterinlineclock: Better inline (Chili) Clock on Latte dock')
makedepends=('git')
provides=('moe-kde')
conflicts=('moe-kde')
install=${pkgname}.install
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_gitname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_gitname}"

  echo 'Installing color-schemes...'
  install -dm755 "${pkgdir}/usr/share/color-schemes"
  cp color-schemes/* "${pkgdir}/usr/share/color-schemes"
  cp "Moe-Dark-color-schemes"/* "${pkgdir}/usr/share/color-schemes"

  echo 'Installing desktoptheme...'
  install -dm755 "${pkgdir}/usr/share/plasma/desktoptheme"
  cp -r Moe "${pkgdir}/usr/share/plasma/desktoptheme"
  cp -r Moe-Dark "${pkgdir}/usr/share/plasma/desktoptheme"

  echo 'Installing look and feel theme...'
  install -dm755 "${pkgdir}/usr/share/plasma/look-and-feel"
  cp -r look-and-feel/* "${pkgdir}/usr/share/plasma/look-and-feel"

  echo 'Installing aurorae themes'
  install -dm755 "${pkgdir}/usr/share/aurorae/themes"
  cp -r aurorae/* "${pkgdir}/usr/share/aurorae/themes"
  cp -r MoeDark-aurorae/* "${pkgdir}/usr/share/aurorae/themes"

  echo 'Installing Kvantum theme...'
  install -dm755 "${pkgdir}/usr/share/Kvantum"
  cp -r kvantum/* "${pkgdir}/usr/share/Kvantum"
  cp -r "Moe-Dark-kvantum"/* "${pkgdir}/usr/share/Kvantum"

  echo 'Installing konsole theme...'
  install -dm755 "${pkgdir}/usr/share/konsole"
  cp konsole/* "${pkgdir}/usr/share/konsole"
  cp "Moe-Dark-konsole"/* "${pkgdir}/usr/share/konsole"
}
