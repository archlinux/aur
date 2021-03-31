# Maintainer: Tobias Frisch <thejackimonster@gmail.com>

_name=pEpJNIAdapter
_pkgname=pep-jni-adapter
pkgname=$_pkgname-git
pkgver=2.1.20
pkgrel=1
pkgdesc="p≡p JNI adapter"
arch=('x86_64' 'i686')
url='https://gitea.pep.foundation/pEp.foundation/pEpJNIAdapter'
license=('GPL3')
makedepends=('git' 'make' 'yml2' 'pep-engine' 'libpep-adapter' 'java-environment')
depends=('pep-engine' 'libpep-adapter' 'java-runtime')
provides=('pep-jni-adapter')
source=("git+https://gitea.pep.foundation/pEp.foundation/pEpJNIAdapter.git")
md5sums=('SKIP')

prepare() {	
	cd "$srcdir/$_name"
	
	echo "PREFIX=$pkgdir" > 'local.conf'
	echo "CXX=g++" >> 'local.conf'
	echo "DEBUG=0" >> 'local.conf'
	echo "JAVA_HOME=/usr/lib/jvm/default" >> 'local.conf'
	echo "USE_JAVAH=1" >> 'local.conf'
	echo "YML2_PATH=/usr/bin" >> 'local.conf'
	echo "ENGINE_LIB_PATH=/usr/lib" >> 'local.conf'
	echo "ENGINE_INC_PATH=/usr/include" >> 'local.conf'
	echo "AD_LIB_PATH=/usr/lib" >> 'local.conf'
	echo "AD_INC_PATH=/usr/include" >> 'local.conf'
}

pkgver() {
	cd "$srcdir/$_name"

	git tag | grep "^Release" | grep -v RC | sort -V -r | head -1 | tr '_-' ' ' | awk '{print $2}'
}

build() {
	cd "$srcdir/$_name"

	make
}

package() {
	cd "$srcdir/$_name"

	make install
}

