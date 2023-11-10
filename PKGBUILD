# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=plasma5-theme-mcsur-git
pkgver=r11.fa3dd65
pkgrel=1
pkgdesc='A materia Design theme for KDE Plasma desktop.'
url='https://github.com/yeyushengfan258/McSur-kde'
license=('GPL3')
arch=('any')
replaces=(plasmasur-dark-kde-theme-git)
makedepends=('git')
optdepends=(
  'plasma-desktop: For plasma theme'
  'kvantum-qt5: For kvantum theme'
  'sddm: For SDDM theme'
)
source=("${pkgname}::git+https://github.com/yeyushengfan258/McSur-kde.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname}"

  install -dm0755 "${pkgdir}/usr/share/aurorae/themes"
  cp -rt "${pkgdir}/usr/share/aurorae/themes" aurorae/*

  install -dm0755 "${pkgdir}/usr/share/color-schemes"
  cp -rt "${pkgdir}/usr/share/color-schemes" color-schemes/*.colors

  install -dm0755 "${pkgdir}/usr/share/Kvantum"
  cp -rt "${pkgdir}/usr/share/Kvantum" Kvantum/*

  install -dm0755 "${pkgdir}/usr/share/plasma/desktoptheme"
  cp -rt "${pkgdir}/usr/share/plasma/desktoptheme" plasma/desktoptheme/*

  install -dm0755 "${pkgdir}/usr/share/plasma/look-and-feel"
  cp -rt "${pkgdir}/usr/share/plasma/look-and-feel" plasma/look-and-feel/*

  install -dm0755 "${pkgdir}/usr/share/wallpapers"
  cp -rt "${pkgdir}/usr/share/wallpapers" wallpaper/*

  install -dm0755 "${pkgdir}/usr/share/sddm/themes"
  cp -rt "${pkgdir}/usr/share/sddm/themes" sddm-dark/McSur-dark sddm-light/McSur-light

  # Fix permissions
  find "${pkgdir}/usr/share" -type f -exec chmod 0644 '{}' +
}
