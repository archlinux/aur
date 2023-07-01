# Maintainer: Swapnil Devesh <me@sidevesh.com>

pkgname=luminance
_pkgname=Luminance
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple GTK application to control brightness of displays including external displays supporting DDC/CI"
arch=('x86_64')
url="https://github.com/sidevesh/$_pkgname"
license=('GPL3')
makedepends=('git')
depends=('gtk3' 'ddcutil')
provides=("$pkgname")
conflicts=("$pkgname")
source=("git+https://github.com/sidevesh/$_pkgname.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"
  ./build.sh
}

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  cp ./build/app "$pkgdir/usr/bin/com.sidevesh.Luminance"
  cp "./install_files/com.sidevesh.Luminance.desktop" "$pkgdir/usr/share/applications/com.sidevesh.Luminance.desktop"
  cp "./install_files/com.sidevesh.Luminance.gschema.xml" "$pkgdir/usr/share/glib-2.0/schemas/"
  cp "./install_files/44-backlight-permissions.rules" "$pkgdir/usr/lib/udev/rules.d/44-backlight-permissions.rules"
  cp "./install_files/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.sidevesh.Luminance.svg"
}

post_install() {
  /usr/bin/glib-compile-schemas /usr/share/glib-2.0/schemas/
  /usr/bin/gtk-update-icon-cache "$pkgdir/usr/share/icons/hicolor/"
}

post_upgrade() {
  /usr/bin/glib-compile-schemas /usr/share/glib-2.0/schemas/
  /usr/bin/gtk-update-icon-cache "$pkgdir/usr/share/icons/hicolor/"
}

post_remove() {
  /usr/bin/glib-compile-schemas /usr/share/glib-2.0/schemas/
  /usr/bin/gtk-update-icon-cache "$pkgdir/usr/share/icons/hicolor/"
}
