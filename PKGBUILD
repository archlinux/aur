# Maintainer: Huang-Huang Bao <eh5@sokka.cn>

pkgname=fdk-aac-free
pkgver=0.1.6
pkgrel=3
pkgdesc='The Third-Party Modified Version of the Fraunhofer FDK AAC Codec Library for Android is software that implements part of the MPEG Advanced Audio Coding ("AAC") encoding and decoding scheme for digital audio.'
arch=("i686" "x86_64" "arm" "armv6h" "armv7h" "aarch64")
url='https://cgit.freedesktop.org/~wtay/fdk-aac/log/?h=fedora'
license=(custom:FDK-AAC)
makedepends=(git)
provides=(libfdk-aac libfdk-aac.so)
conflicts=(libfdk-aac)
source=(git+git://people.freedesktop.org/~wtay/fdk-aac#commit=455feca42c8e1576fbc836f5b613295847a670ed)
sha256sums=('SKIP')

prepare() {
  cd fdk-aac

  autoreconf -vif
}

build() {
  cd fdk-aac

  ./configure \
    --prefix='/usr' \
    --disable-static
  make
}

package () {
  cd fdk-aac

  make DESTDIR="${pkgdir}" install
  install -Dm 644 NOTICE -t "${pkgdir}"/usr/share/licenses/libfdk-aac/
}
