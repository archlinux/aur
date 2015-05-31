# Maintainer: Can Celasun <dcelasun[at]gmail[dot]com>
pkgname=netsniff-ng-git
_gitname=netsniff-ng
pkgver=v0.5.8.rc4.16.g61fa17c
pkgrel=1
pkgdesc='A high performance Linux network sniffer for packet inspection (git version, without curvetun tool).'
arch=('i686' 'x86_64')
url='http://netsniff-ng.org/'
license=('GPL2')
provides=('netsniff-ng')
conflicts=('netsniff-ng')
makedepends=('cmake' 'flex' 'bison')
depends=('ncurses' 'geoip' 'zlib' 'libnetfilter_conntrack' 'libpcap' 'liburcu' 'libnl' 'libcli' 'libnet')
optdepends=('libnacl: Needed for curvetun')
source=('git://github.com/borkmann/netsniff-ng.git')
md5sums=('SKIP')

pkgver() {
cd $_gitname
git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/${_gitname}"
  ./configure
  make DISTRO=1
}

package() {
  cd "$srcdir/${_gitname}"
  make PREFIX="$pkgdir" install_allbutmausezahn
}
