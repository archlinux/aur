# Maintainer:  M0Rf30
# Contributor: Dan Serban
# Contributor: zbito <ztokarczyk at gmail dot com

pkgname=steadyflow
pkgver=0.2.0
pkgrel=4
pkgdesc="A download manager that aims for minimalism, ease of use, and a clean, malleable codebase"
arch=('i686' 'x86_64')
url=https://launchpad.net/steadyflow
license=('GPL3')
install=steadyflow.install 
depends=('desktop-file-utils' 'glib2' 'gtk3' 'gvfs' 'libgee06' 'libnotify' 'libunique')
makedepends=('cmake' 'vala' 'wget')
conflicts=('steadyflow-bzr')
source=(http://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.xz
	patch)

build() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../patch
  cmake -DCMAKE_INSTALL_PREFIX='/usr' -DCOMPILE_GSETTINGS_ON_INSTALL=NO -DWANT_AYATANA=NO
  make
}

package() {
  cd $pkgname-$pkgver
  make install DESTDIR="$pkgdir"
  mkdir -p "$pkgdir"/usr/share/pixmaps
  wget -O "$pkgdir"/usr/share/pixmaps/steadyflow.png https://launchpadlibrarian.net/55910801/steadyflow-64px.png
}

md5sums=('16b9907c1d681e7f0a861f066d4fda0e'
         '53ff49bd70c499fa75498ba06250e7fc')
