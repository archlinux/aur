# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-weather-oclock-git
_uuid=weatheroclock@CleoMenezesJr.github.io
pkgver=47.0.r1.g5189844
pkgrel=1
pkgdesc="Display the current weather inside the pill next to the clock."
arch=('any')
url="https://github.com/CleoMenezesJr/weather-oclock"
license=('GPL-3.0-or-later')
depends=(
  'gnome-shell'
  'gnome-weather'
)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/CleoMenezesJr/weather-oclock.git')
sha256sums=('SKIP')

pkgver() {
  cd weather-oclock
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd weather-oclock
  make DESTDIR="$pkgdir" install

  install -Dm644 "${_uuid}/schemas/org.gnome.shell.weather-oclock.gschema.xml" -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -r "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"
}
