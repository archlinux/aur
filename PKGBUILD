pkgname='kopano-libvmime-git'
provides=(
    'libvmime'
	 )
pkgver=0.9.2k4
pkgrel=1
pkgdesc='A C++ class library for working with MIME messages'
arch=(
    'armv7l'
    'aarch64'
    'i686'
    'x86_64'
     )
url='http://www.vmime.org/'
license=(
    'GPL'
	)
conflicts=(
    'libvmime'
    'libvmime-git'
    'zarafa-libvmime'
	  )
source=(
    "git+https://github.com/Kopano-dev/vmime.git#tag=v${pkgver}"
	)
md5sums=(
    'SKIP'
	)


makedepends=(
    'cmake'
    'postfix'
    'doxygen'
    'xdot'
    
    # PKGBUILD dependencies
    'git'
	    )
depends=(
    'gsasl' 
    'gnutls'
	)

prepare() {
    mkdir build
}

build() {
    cd build
    
    cmake ../vmime \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=/usr/lib/ \
    -DCMAKE_BUILD_TYPE=Release
    
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}