# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Benoit Favre <benoit.favre@lif.univ-mrs.fr>

pkgname=vampy
pkgver=2.3
pkgrel=1
pkgdesc="Wrapper plugin that enables you to use Python Vamp in any Vamp host."
arch=(any)
url="https://code.soundsoftware.ac.uk/projects/pyin"
_url="https://gitlab.com/tallero/vampy"
_sdk_url="https://github.com/c4dm/vamp-plugin-sdk"
license=('GPL')
depends=(vamp-plugin-sdk python python2)
source=("git+$_url")
md5sums=('SKIP') 

build() {
	cd $pkgname
        git clone $_sdk_url
        cd "vamp-plugin-sdk"
        ./configure
        make -j3
        cd .. &&
	make LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib CPPFLAGS="-Wno-error=register" -f Makefile.linux
}

package() {
	cd $pkgname
	install -Dm755 vampy.so "$pkgdir/usr/lib/vampy.so"
}
