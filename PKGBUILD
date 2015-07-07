# Maintainer: Joeny Ang <ang(dot)joeny(at)gmail(dot)com>

pkgname=nautilus-ideviceinfo-git
_gitname=nautilus-ideviceinfo
pkgver=0.1.0.74.g93b6551
pkgrel=1
pkgdesc="Show information about your iOS device"
arch=('i686' 'x86_64')
url="http://www.libimobiledevice.org/"
license=('GPL')
depends=('libimobiledevice' 'nautilus')
optdepends=('mobile-broadband-provider-info: to show mobile carrier'
            'libgpod>=0.7.90: to enable detailed audio/video information')
makedepends=('git' 'intltool' 'automake')
options=(!libtool)
source=("git://git.gnome.org/${_gitname}")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_gitname}

  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
  
  # Use current date
  # date +%Y%m%d
}

build() {
  cd ${srcdir}/${_gitname}

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${_gitname}

  make DESTDIR=${pkgdir} install
}
