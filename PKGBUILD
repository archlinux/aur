# Maintainer:  VirtualTam <virtualtam@flibidi.net>
pkgname=openav-sorcer-git
pkgver=release.1.1.2.1.g9da6481
pkgrel=1
pkgdesc="A wavetable LV2 plugin synth, targeted at the electronic / dubstep genre"
arch=('i686' 'x86_64')
url="http://openavproductions.com/sorcer/"
license=('GPL3')
depends=('cairo' 'cairomm' 'lv2' 'ntk-git')
makedepends=('cmake' 'git')
optdepends=('jalv')
provides=('openav-sorcer')
_gitname="openAV-Sorcer"
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
}
