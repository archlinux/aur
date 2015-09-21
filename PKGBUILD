# Maintainer:  VirtualTam <virtualtam@flibidi.net>
pkgname=openav-luppp-git
pkgver=release.1.0.1.8.g43aecd2
pkgrel=4
pkgdesc="Luppp is a live performance tool, created by OpenAV productions"
arch=('i686' 'x86_64')
url="http://openavproductions.com/luppp/"
license=('GPL3')
groups=('openav')
depends=('cairo' 'jack2' 'liblo' 'libsamplerate' 'libsndfile' 'ntk-git')
makedepends=('cmake' 'git')
provides=('openav-luppp')
_gitname="openAV-Luppp"
source=(git://github.com/harryhaaren/${_gitname}.git)
sha256sums=(SKIP)

pkgver() {
  cd ${_gitname}
  git describe --always | sed 's|-|.|g'
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
