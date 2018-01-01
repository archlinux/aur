# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Doug Newgard <scimmia at archlinux dot info>
# Contributor: jus <jus@bitgrid.net>
# Contributor: jfperini <@jfperini>

_pkgname=vocal
pkgname=$_pkgname-git
pkgver=2.1.5.r239.cab7185
pkgrel=1
pkgdesc="Podcast Client for the Modern Desktop"
arch=('i686' 'x86_64')
url="http://www.vocalproject.net"
license=('GPL3')
depends=('clutter-gst' 'clutter-gtk' 'desktop-file-utils' 'granite' 'gstreamer' 'gtk-update-icon-cache' 'gtk3' 'libnotify' 'libxml2' 'sqlite' 'webkit2gtk')
makedepends=('cmake' 'git' 'vala')
provides=($_pkgname)
conflicts=($_pkgname)
source=($_pkgname::git://github.com/needle-and-thread/vocal.git)
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  #git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  printf "%s.r%s.%s" "$(git tag --sort=-version:refname | head -1)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  rm -rf build
  mkdir build

  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr   # -DGSETTINGS_COMPILE=0 -DGSETTINGS_LOCALINSTALL=1
  make
}

package() {
  cd $_pkgname/build
  make DESTDIR="$pkgdir/" install
}

