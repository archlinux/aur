# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Benjamin Klettbach <b.klettbach@gmail.com>

pkgname=obs-studio
pkgver=0.15.0
pkgrel=1
pkgdesc="Free, open source software for live streaming and recording"
arch=('i686' 'x86_64')
url="https://obsproject.com"
license=('GPL2')
depends=('ffmpeg' 'jansson' 'libxinerama' 'libxkbcommon-x11'
         'qt5-x11extras' 'curl' 'jack' 'gtk-update-icon-cache')
makedepends=('cmake' 'libfdk-aac' 'libxcomposite' 'x264')
optdepends=('libfdk-aac: FDK AAC codec support'
            'libxcomposite: XComposite capture support')
source=($pkgname-$pkgver.tar.gz::https://github.com/jp9000/obs-studio/archive/$pkgver.tar.gz)
md5sums=('b897b6333f66a8e1d75ceea0ee10e049')

build() {
  cd $pkgname-$pkgver

  mkdir -p build; cd build

  cmake -DCMAKE_INSTALL_PREFIX="/usr" \
    -DOBS_VERSION_OVERRIDE="$pkgver-$pkgrel" ..

  make
}

package() {
  cd $pkgname-$pkgver/build

  make install DESTDIR="$pkgdir"
}
