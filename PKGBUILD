# Maintainer: Jonathan Hudson <jh+gtk-g-rays@daria.co.uk>
# Contributor: Lukas Kramer <lukas@carrotIndustries.net>
pkgname=gtk-g-rays2
pkgver=2.1.0
pkgrel=1
pkgdesc="Access the configuration data (and visualise NMEA data) from the WBT-201 GPS"
arch=('i686' 'x86_64' 'arm' 'aarch64' 'armv7h' 'pentium4')
url='https://github.com/stronnag/gtk-g-rays2.git'
license=('GPL')
depends=('gtk3' 'bluez-libs' 'libgudev')
makedepends=('git' 'meson')
optdepends=('gpsbabel: download log files')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  meson build --prefix=/usr --buildtype=release --strip
  meson compile -C build
}

package() {
  # executable
  cd $pkgname
  DESTDIR="$pkgdir" meson install -C build
}
