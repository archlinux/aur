# Maintainer: Justin Kim <justin.kim@collabora.com>

pkgname=srt-git
pkgver=1.2.0.r103.7607d70
pkgrel=1
pkgdesc='Secure Reliable Transport (Git version)'
arch=('i686' 'x86_64')
license=('LGPL')
url='https://github.com/Haivision/srt'
depends=('openssl')
makedepends=('cmake' 'pkgconfig')
provides=('srt='$pkgver)

_gitname='srt'

source=('git+https://github.com/Haivision/srt.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  version=$(grep -m1 SRT_VERSION CMakeLists.txt | sed 's/^.*[^0-9]\([0-9]*\.[0-9]*\.[0-9]*\).*$/\1/')
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  
  echo $version.r$revision.$hash
}

build() {
  cd $_gitname
  ./configure \
    --prefix=/usr 
  make
}

package() {
  cd $_gitname
  make DESTDIR="${pkgdir}" install
}
