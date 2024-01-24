# Maintainer: 
# Contributor: Mark Wagie <mark.wagie at proton dot me>
# Contributor: toluschr <toluschr at protonmail dot com>
pkgname=yaru-colors-gtk-theme-git
pkgver=21.10.3ubuntu5.r1.gcb79ae7c
pkgrel=4
pkgdesc="A fork of Ubuntu's Yaru theme - in different colors"
arch=('any')
license=('GPL-3.0-or-later')
url="https://github.com/Jannomag/Yaru-Colors"
depends=('gnome-themes-extra')
makedepends=('git' 'meson' 'sassc')
optdepends=('gdk-pixbuf2: GTK2 support'
            'gtk-engine-murrine: GTK2 support')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}"
          'yaru-colors-icon-theme'
#          'yaru-gnome-shell-theme'
          'yaru-gtk-theme'
          'yaru-gtksourceview-theme'
          'yaru-icon-theme'
          'yaru-metacity-theme'
          'yaru-sound-theme'
          'yaru-unity-theme'
          'yaru-xfwm4-theme')
options=('!strip')
source=('git+https://github.com/Jannomag/Yaru-Colors.git#branch=what-if-21.10')
sha256sums=('SKIP')

pkgver() {
  cd Yaru-Colors
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/snap//'
}

build() {
  arch-meson Yaru-Colors build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
