# Maintainer: Justin Kim <justin.kim@collabora.com>

pkgname=libsrt
pkgver=1.2.0
pkgrel=1
pkgdesc='Secure Reliable Transport Library'
arch=('i686' 'x86_64')
license=('LGPL')
url='https://github.com/Haivision/srt'
depends=('openssl')
makedepends=('cmake' 'pkgconfig')
provides=('libsrt='$pkgver)

_gitname='srt'
_commit=891a66d7e8a55ea0553546895db3b57ecf5ab044 # tag v1.2.0
source=("git+https://github.com/Haivision/srt.git#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --tags | sed 's/^v//g'
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
