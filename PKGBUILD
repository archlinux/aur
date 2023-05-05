# Maintainer: Ruben Agin <phabrics@phabrics.com>
pkgname=tme
pkgver=0.12rc10
pkgrel=1
pkgdesc="The Machine Emulator, or tme, provides a general-purpose framework for computer emulation."
arch=('i686' 'x86_64')
license=('GPL3')
url="http://phabrics.com"
optdepends=('perl-x11-protocol: for computing optimal graphics parameters'
	    'libvncserver: graphics hosted via VNC server'
	    'gtk4: graphics hosted via GTK4'
	    'sdl2: graphics hosted via SDL2')
makedepends=('perl-x11-protocol' 'libvncserver' 'gtk4' 'sdl2')
source=("https://osdn.net/dl/nme/${pkgname}-${pkgver}.tar.xz")
sha256sums=('e2c90f7c63de196c7bf52c9b06f17e2ab9db86fa86d8c3ff3ee2360fb20914f8')
options=(libtool debug !strip)
install=$pkgname.install

prepare()
{
  cd "$pkgname-$pkgver"
  sed -i '/#include "display.h"/i unsigned int _tme_scanline_pad(int bpl);' host/display/display.c
}

build()
{
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --disable-ltdl-install --enable-debug
  make
}

package()
{
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
