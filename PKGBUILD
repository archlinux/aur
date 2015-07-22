# Maintainer: Christoph Drexler <chrdr at gmx dot at>

pkgname=openfst
pkgver=1.5.0
pkgrel=1
pkgdesc="Library for constructing, combining, optimizing, and searching weighted finite-state transducers (FSTs)"
arch=('i686' 'x86_64')
url="http://www.openfst.org/"
license=('APACHE')
depends=('gcc-libs' 'glibc' 'python2')
options=(!libtool)
source=("http://openfst.cs.nyu.edu/twiki/pub/FST/FstDownload/${pkgname}-${pkgver}.tar.gz")
sha256sums=('01c2b810295a942fede5b711bd04bdc9677855c846fedcc999c792604e02177b')


build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	# Options according to http://openfst.cs.nyu.edu/twiki/bin/view/FST/ReadMe
	OPTIONS="--prefix=/usr --disable-dependency-tracking"
	OPTIONS+=" --enable-bin"            # Enable fst::script and command-line binaries;   Default: yes
	OPTIONS+=" --enable-compact-fsts"   # Enable all CompactFst classes;                  Default: no
	OPTIONS+=" --enable-compress"       # Enable compression extension;                   Default: no
	OPTIONS+=" --enable-const-fsts"     # Enable all ConstFst classes;                    Default: no
	OPTIONS+=" --enable-far"            # Enable FAR (FST Archive) extension;             Default: no
	OPTIONS+=" --enable-linear-fsts"    # Enable Linear{Tagger,Classifier}Fst extensions; Default: no
	OPTIONS+=" --enable-lookahead-fsts" # Enable LookAheadFst classes;                    Default: no
	OPTIONS+=" --enable-mpdt"           # Enable MPDT extensions;                         Default: no
	OPTIONS+=" --enable-ngram-fsts"     # Enable NGramFst extensions;                     Default: no
	OPTIONS+=" --enable-pdt"            # Enable PDT extensions;                          Default: no
	OPTIONS+=" --enable-python"         # Enable Python extensions;                       Default: no
	LIBS="-ldl" ./configure $OPTIONS
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install
}
