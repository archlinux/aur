# contributed by fenugrec 2018/11
# note : this only compiles the minimum amount of docs.

# The author calls this 'AS' but names his Debian package 'asl'.
# Unfortunately there's an old, unrelated 'asl' package in AUR,
# and 'as' would clash with "GNU AS", therefore this is 'mas'.
#

pkgname=mas
_pkgbuild=300
pkgver=1.42b${_pkgbuild}
_pkgfilebase=asl-current
_pkgfile=${_pkgfilebase}-142-bld${_pkgbuild}
pkgrel=1
pkgdesc="Macro cross-assembler (asl) for various processors and microcontrollers."
arch=("i686" "x86_64")
url='http://john.ccac.rwth-aachen.de:8000/as/'
license=('GPL-2.0-only')

#required for full docs
#makedepends=('texlive-core')

source=("http://john.ccac.rwth-aachen.de:8000/ftp/as/source/c_version/${_pkgfile}.tar.bz2"
				"Makefile.def"
				"makefile_nodocs.patch")

sha256sums=('42095a1d0971e58776ae82cc42f8fb86a9f73daa7087ff1f9e95243d68d7174d'
            'c313ee110a0c5ffc4908890ccf439da14f0bc90d923a9839b12e88ae51038938'
            '67c5d45388250f030c0cf5dfa4c18bec0f55aa2d5ae9b21875d32b0167d3e9d7')

prepare() {
	cd "${_pkgfilebase}"
	cp ../Makefile.def .
	patch -i ../makefile_nodocs.patch
}

build() {
	cd "${_pkgfilebase}"
	make
}


package() {
	cd "${_pkgfilebase}"
	make DESTDIR="$pkgdir" install
}
