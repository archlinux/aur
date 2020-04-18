# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=htcondor
pkgver=8.8.8
pkgrel=1
epoch=
pkgdesc=""
arch=("x86_64")
url=""
license=('GPL')
groups=()
depends=("boost" "munge" "libxss" "curl" "gawk" "java-runtime" "libcgroup" "pcre" "sqlite" "python")
makedepends=("cmake")
checkdepends=()
optdepends=()
provides=("htcondor")
conflicts=("htcondor")
replaces=()
backup=()
options=()
install=
changelog=
source=("https://research.cs.wisc.edu/htcondor/debian/8.8/buster/pool/contrib/c/condor/condor_$pkgver.orig.tar.gz")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
	cd "condor-$pkgver"
	mkdir -p build_folder
	cd build_folder
	cmake -DSYSTEM_NAME=arch -DWITH_VOMS=False -DWITH_GLOBUS=False -DWITH_PYTHON_BINDINGS=False -DCMAKE_INSTALL_PREFIX=/opt/htcondor ../
	make
}

package() {
	cd "condor-$pkgver/build_folder"
	make DESTDIR="$pkgdir/" install
	
	echo "export PATH=$PATH:/opt/htcondor/bin" > $srcdir/htcondor.sh
	install -Dm644 $srcdir/htcondor.sh $pkgdir/etc/profile.d/htcondor.sh
}
