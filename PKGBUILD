# Maintainer: Milk Brewster (milk/milkii on Freenode)
# Contributor:  VirtualTam <virtualtam@flibidi.net>
pkgname=openav-luppp-git
pkgver=1.1.1.r15.gbe14f40
pkgrel=1
pkgdesc="Luppp is a live performance tool, created by OpenAV productions (unstable development package)"
arch=('i686' 'x86_64')
url="http://openavproductions.com/luppp/"
license=('GPL3')
groups=('openav')
depends=('jack' 'liblo' 'ntk-git')
makedepends=('cmake' 'git')
provides=('openav-luppp-git' 'luppp')
conflicts=('openav-luppp-git' 'luppp')
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
