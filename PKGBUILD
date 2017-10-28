pkgname=plasma-runners-tmux
_srcname=krunner-tmux-sessions
pkgver=0.0.2
pkgrel=1
pkgdesc="Searches running tmux sessions and attaches to them"
arch=('i686' 'x86_64')
depends=('tmux' 'krunner')
makedepends=('cmake' 'extra-cmake-modules')
url="https://github.com/Teyras/krunner-tmux-sessions"
license=('MIT')
source=(https://github.com/Teyras/krunner-tmux-sessions/archive/${pkgver}.tar.gz)
sha1sums=('1cef8ff29d376731acbb7db1e2dd51a3ce6fabb4')

prepare() {
	mkdir -p build
}
  
build()
{
	cd build
      
	cmake ../${_srcname}-${pkgver} \
		-DCMAKE_INSTALL_PREFIX=$(kf5-config --prefix) \
		-DQT_PLUGIN_INSTALL_DIR=$(kf5-config --qt-plugins) \
		-DCMAKE_BUILD_TYPE=Release
	make
}
          		  	   
package()
{
	cd build
	make DESTDIR=${pkgdir} install
}

