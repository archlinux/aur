# Maintainer: Ruben Agin <phabrics@phabrics.com>
_gtk="${GTKMAJ:-gtk4}"
pkgname=tme
pkgver=0.12rc11
pkgrel=1
pkgdesc="The Machine Emulator, or tme, provides a general-purpose framework for computer emulation."
arch=('i686' 'x86_64')
license=('GPL3')
url="http://phabrics.com"
optdepends=('perl-x11-protocol: for computing optimal graphics parameters'
	    'libvncserver: graphics hosted via VNC server'
	    "${_gtk}: graphics hosted via ${_gtk}"
	    'sdl2: graphics hosted via SDL2')
makedepends=('perl-x11-protocol' 'libvncserver' "${_gtk}" 'sdl2')
source=("https://github.com/phabrics/nme/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz")
#source=("https://osdn.net/dl/nme/${pkgname}-${pkgver}.tar.xz")
sha256sums=('ea72a457e0fe8144f985e0a5bf848cd5872a807f47fad492b9e1e5fbd7c173bf')
options=(libtool debug !strip lto)
install=$pkgname.install

prepare()
{
  cd "$pkgname-$pkgver"
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
