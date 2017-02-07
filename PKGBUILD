# Contributor: freedcpp at seznam dot cz
pkgname=bmdc-bzr
pkgver=r865
pkgrel=1
pkgdesc="DC + + client based on the source code FreeDC + + with Ignore Users."
arch=('i686' 'x86_64')
url="http://launchpad.net/bmdc++"
license=('GPL')
depends=('bzip2' 'gtk3>=3.6' 'libnotify' 'openssl' 'geoip' 'libtar' 'libcanberra' 'gettext' )
makedepends=('pkgconfig' 'bzr' 'scons' 'gcc')
provides=('bmdc')
conflicts=('linuxdcpp' 'linuxdcpp-bzr' 'linuxdcpp-bzr-i18n' 'freedcpp')
install=$pkgname.install

source=('bmdc-bzr::bzr+https://code.launchpad.net/~manky/bmdc++/trunk')
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
printf "r%s" "$(bzr revno)"
}

build() {
    cd "$pkgname"
        
 	msg "Starting make..."
	
	#./linux/gen.sh				
 	scons PREFIX=/usr/ LIBDIR=/usr/share || return 1
}

package() {
    cd "$pkgname"
    scons PREFIX=/usr/ LIBDIR=/usr/share install FAKE_ROOT=$pkgdir/ || return 1	
}
