# Maintainer: Mark Wagie <mark.wagie at tutanota dot com>
# Contributor: toluschr <toluschr at protonmail dot com>
pkgname=('yaru-colors-gtk-theme-git'
         'yaru-colors-icon-theme-git'
         'yaru-colors-wallpapers-git')
pkgbase='yaru-colors-gtk-theme-git'
pkgver=21.10.3ubuntu5.r1.gcb79ae7c
pkgrel=1
pkgdesc="A fork of Ubuntu's Yaru theme - in different colors"
arch=('any')
license=('GPL3')
url="https://github.com/Jannomag/Yaru-Colors"
makedepends=('git')
options=('!strip')
source=('git+https://github.com/Jannomag/Yaru-Colors.git#branch=what-if-21.10')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Yaru-Colors"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/snap//'
}

package_yaru-colors-gtk-theme-git() {
  depends=('gnome-themes-extra')
  optdepends=('gdk-pixbuf2: GTK2 support'
              'gtk-engine-murrine: GTK2 support'
              'yaru-colors-wallpapers: Matching wallpapers'
              'yaru-colors-icon-theme: Matching icon theme'
              'yaru-sound-theme: Matching sound theme')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$srcdir/Yaru-Colors"
  install -d "$pkgdir/usr/share/themes"
  cp -a Themes/* "$pkgdir/usr/share/themes"
}

package_yaru-colors-icon-theme-git() {
  depends=('yaru-icon-theme')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$srcdir/Yaru-Colors"
  install -d "$pkgdir/usr/share/icons"
  cp -a Icons/* "$pkgdir/usr/share/icons"
}

package_yaru-colors-wallpapers-git() {
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$srcdir/Yaru-Colors"
  install -d "$pkgdir/usr/share/backgrounds/yaru-colors"
  cp -a Wallpapers/* "$pkgdir/usr/share/backgrounds/yaru-colors"
}
