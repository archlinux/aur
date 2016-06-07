# Contributor: Tibor Bamhor <tiborb95 at gmail.com>

pkgname=gimp-plugin-satequalizer
pkgver=0.9.2
pkgrel=1
pkgdesc="Saturation equalizer. 6-bands equalizer, brightness adjustment, auto white calibration and more."
url="http://code.google.com/p/satequalizer/"
license=('GPL-3')
arch=('i686' 'x86_64')
depends=(gimp)
#makedepends=()
source=()



build() {

	#defining variables
	work_dir=$srcdir/satequalizer/  
	cd $srcdir
    test -d satequalizer || mkdir satequalizer
	cd $work_dir || exit 1
	
    git clone --branch v${pkgver} https://github.com/tibor95/gimp-plugin-satequalizer.git .

	#to fix problem: undefined reference to symbol 'pow@@GLIBC_2.0'
	export LDFLAGS="$LDFLAGS -lm"
	
	#compiling
	gimptool-2.0  --build saturate.c || exit 1
	}

package() {
	#copying compiled binary into pkgdir to be packed
	mkdir -p ${pkgdir}/usr/lib/gimp/2.0/plug-ins/
	install -m 755 ${srcdir}/satequalizer/saturate ${pkgdir}/usr/lib/gimp/2.0/plug-ins/ 
	
	}

sha1sums=() 
