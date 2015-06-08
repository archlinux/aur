# Maintainer: Mank <Mank1@seznam.cz>
pkgname=xfce4-nameday-plugin-bzr
pkgver=0.0.6
pkgrel=1
pkgdesc="Xfce Applet ,that's show namedays"
url="https://launchpad.net/xfce4-nameday-plugin"
arch=('i686' 'x86_64')
license=('GPLv2')
provides=(xfce4-nameday-plugin)
depends=('xfce4-panel' 'libunique')
makedepends=('pkgconfig' 'bzr' 'xfce4-dev-tools' 'gcc' 'intltool')

_bzrmod=xfce4-nameday-plugin
_bzrtrunk=lp:${_bzrmod}

build() {
  cd "$srcdir"
  msg "Getting source ..."
	if [ ! -d ./${_bzrmod} ]; then
		bzr branch ${_bzrtrunk}
	else
		bzr update ${_bzrtrunk}
	fi
  cd ${_bzrmod}
  msg "Checkout done or error"	
  msg "Building..." 		
    
  sh autogen.sh --prefix=/usr || return 1
  make || return 1
  msg "Building end"
}

package() {
  cd "$srcdir/$_bzrmod"

  make DESTDIR="$pkgdir/" install
}
