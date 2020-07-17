# Maintainer: Carlo Teubner <carlo at cteubner dot net>
# Contributor: Brett Cornwall <ainola@archlinux.org>
# Contributor: Andrey Solomatin
# Contributor: carstene1ns
# Contributor: Lukas Fleischer
# Contributor: Geoffrey Teale
# Contributor: Mark, Huo Mian
# Contributor: Biginoz
# Contributor: Mattias Andrée

pkgname=gammastep-git
pkgver=1.12.r37.ge3ddf54
pkgrel=1
pkgdesc="Adjusts the color temperature of your screen according to your surroundings."
arch=('x86_64')
url="https://github.com/CameronNemo/redshift"
license=('GPL3')
depends=('glib2' 'wayland' 'libdrm' 'libxxf86vm' 'geoclue')
optdepends=('python-gobject: for gammastep-indicator'
            'python-xdg: for gammastep-indicator'
            'gtk3: for gammastep-indicator')
makedepends=('intltool' 'python' 'git')
source=("git+https://github.com/CameronNemo/redshift")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/redshift"
  git describe --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd "$srcdir/redshift"
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/redshift"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
