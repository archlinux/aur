# Maintainer:  VirtualTam <virtualtam@flibidi.net>
pkgname=openav-luppp-git
pkgver=1.1.r1.g01f71ec
pkgrel=1
pkgdesc="Luppp is a live performance tool, created by OpenAV productions"
arch=('i686' 'x86_64')
url="http://openavproductions.com/luppp/"
license=('GPL3')
groups=('openav')
depends=('jack2' 'liblo' 'ntk-git')
makedepends=('cmake' 'git')
provides=('openav-luppp')
_gitname="openAV-Luppp"
source=(git://github.com/harryhaaren/${_gitname}.git)
sha256sums=(SKIP)

pkgver() {
  cd ${_gitname}
  git describe --long --tags | sed 's/^release.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  cd ${_gitname}
  cmake ./ -DCMAKE_INSTALL_PREFIX="/usr" -DRELEASE_BUILD=1
  make
}

package() {
  cd ${_gitname}
  make DESTDIR=${pkgdir} install
  install -Dm644 "resources/metadata/luppp.desktop" "${pkgdir}/usr/share/applications/luppp.desktop"
  install -Dm644 "resources/icons/luppp.png" "${pkgdir}/usr/share/luppp/luppp.png"
}
