# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Lara Maia <lara@craft.net.br>
# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=redshift-git
pkgver=1.9.r10.gf436cf6
pkgrel=1
pkgdesc='Adjusts the color temperature of your screen according to your surroundings (development version)'
arch=('i686' 'x86_64')
url='http://jonls.dk/redshift/'
license=('GPL3')
depends=('libxxf86vm' 'libdrm' 'libxcb' 'geoclue')
provides=('redshift')
conflicts=('redshift')
optdepends=('gtk3: for redshift-gtk'
            'python-xdg: for redshift-gtk'
            'python-gobject: for redshift-gtk'
            'librsvg: for redshift-gtk'
            'hicolor-icon-theme: for redshift-gtk')
makedepends=('git' 'python') # python needed for redshift-gtk
install=$pkgname.install
source=(redshift::"git+https://github.com/jonls/redshift.git")
md5sums=('SKIP')

pkgver() {
  cd redshift
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
  cd redshift

  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  make -C redshift DESTDIR="$pkgdir" install
}
