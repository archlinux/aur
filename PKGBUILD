# Maintainer: Brett Cornwall <ainola@archlinux.org>
# Contributor: Andrey Solomatin
# Contributor: carstene1ns
# Contributor: Lukas Fleischer
# Contributor: Geoffrey Teale
# Contributor: Mark, Huo Mian
# Contributor: Biginoz
# Contributor: Mattias Andrée

pkgname=redshift-wayland-git
pkgver=1.12.r25.g7da875d
pkgrel=1
pkgdesc='Adjusts the color temperature of your screen according to your surroundings.'
arch=('x86_64')
url='http://jonls.dk/redshift/'
license=('GPL3')
provides=('redshift' 'redshift-sway-git')
conflicts=('redshift' 'redshift-sway-git')
depends=('geoclue2' 'libdrm' 'libxcb' 'libxxf86vm' 'wayland')
optdepends=('python-gobject: for redshift-gtk'
            'python-xdg: for redshift-gtk'
            'gtk3: for redshift-gtk')
makedepends=('intltool' 'python' 'git')
source=(redshift::"git+https://github.com/minus7/redshift.git#branch=wayland")
md5sums=('SKIP')

pkgver() {
  cd redshift
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
  cd redshift

  ./bootstrap
  ./configure --prefix=/usr \
              --enable-drm \
              --enable-randr \
              --enable-vidmode \
              --enable-geoclue2 \
              --with-systemduserunitdir=/usr/lib/systemd/user \
              --enable-wayland
  make
}

package() {
  cd redshift
  make DESTDIR="$pkgdir" install
}
