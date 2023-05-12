# Maintainer: Ruben Agin <phabrics@phabrics.com>
_fragment="${FRAGMENT:-#branch=main}"
_gtk="${GTKMAJ:-gtk4}"
pkgname=tme-git
pkgver=0.12latest
pkgrel=1
pkgdesc="The Machine Emulator, or tme, provides a general-purpose framework for computer emulation."
arch=('i686' 'x86_64')
license=('GPL3')
url="https://nme.osdn.io"
optdepends=('perl-x11-protocol: for computing optimal graphics parameters'
	    'libvncserver: graphics hosted via VNC server'
	    "${_gtk}: graphics hosted via ${_gtk}"
	    'sdl2: graphics hosted via SDL2')
makedepends=('git' 'perl-x11-protocol' 'libvncserver' "${_gtk}" 'sdl2')
provides=('tme')
conflicts=('tme')
source=("tme::git+https://scm.osdn.net/gitroot/nme/tme.git${_fragment}")
sha256sums=('SKIP')
options=(libtool debug !strip)
install=$pkgname.install

build()
{
    cd "$srcdir/tme"
    autoreconf -fi
    ./configure --prefix=/usr --disable-ltdl-install --enable-debug 
    make
}

package()
{
    cd "$srcdir/tme"
    make DESTDIR="$pkgdir/" install
}
