pkgname=('libx264-142')
pkgdesc='Library for encoding H264/AVC video streams (older version)'
pkgver=142.20140826
pkgrel=1
epoch=1
arch=('i686' 'x86_64')
url='http://www.videolan.org/developers/x264.html'
license=('GPL')
depends=('glibc')
makedepends=('yasm' 'git' 'ffmpeg')
provides=('libx264.so.142')
source=(git://git.videolan.org/x264.git#commit=021c0dc6c95c)
md5sums=('SKIP')

pkgver() {
  cd x264
  local _ver=$(grep '#define X264_BUILD' x264.h | cut -d' ' -f3)
  local _date=$(git log -1 --format="%cd" --date=short | tr -d -)

  echo ${_ver}.${_date}
}

build() {
  cd x264
  ./configure --prefix=/usr \
    --enable-shared --enable-pic
  make
}

package() {

  cd "${srcdir}"/x264
  install -d "$pkgdir"/usr/lib
  install -Dm755 "./libx264.so.142" "${pkgdir}/usr/lib/libx264.so.142"
}

