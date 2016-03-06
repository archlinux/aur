# Maintainer: Bjoern Bidar <theodorstormgrade@gmail.com>
pkgname=plasma-runners-ssh
_srcname=ssh-runner
pkgver=0.2
pkgrel=1
pkgdesc="Allows starting SSH connections with krunner"
arch=('i686' 'x86_64')
depends=('openssh' 'krunner')
makedepends=('cmake' 'extra-cmake-modules')
url="http://kde-apps.org/content/show.php/VBox+Runner?content=174305"
license=('GPL')
source=(https://github.com/Thaodan/ssh-runner/archive/${pkgver}.tar.gz)
sha1sums=('69619c24de0cb9f9ba6689a75659e6098232dc5b')

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
