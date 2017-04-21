# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Doug Newgard <scimmia at archlinux dot info>
# Contributor: jus <jus@bitgrid.net>
# Contributor: jfperini <@jfperini>

_pkgname=vocal
pkgname=$_pkgname-git
pkgver=2.0.13.beta.r13.gbced2e2
pkgrel=1
pkgdesc="Podcast Client for the Modern Desktop"
arch=('i686' 'x86_64')
url="http://www.vocalproject.net"
license=('GPL3')
depends=('libnotify' 'libxml2' 'granite' 'gtk3' 'gstreamer' 'sqlite' 'clutter-gtk' 'clutter-gst' 'webkit2gtk')
makedepends=('git' 'vala' 'cmake')
provides=($_pkgname)
conflicts=($_pkgname)
#source=($_pkgname::git://github.com/needle-and-thread/vocal.git)
source=($_pkgname::git://github.com/vocalapp/vocal.git)
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname

  # Use newer version of webkit2gtk
  sed -i 's/webkit2gtk-3.0/webkit2gtk-4.0/g' CMakeLists.txt
}

build() {
  cd $_pkgname
  rm -rf build
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr    # -DGSETTINGS_LOCALINSTALL=1 -DGSETTINGS_COMPILE=1
  make
}

package() {
  cd $_pkgname/build
  make DESTDIR="$pkgdir/" install
}

