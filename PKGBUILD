# Maintainer: Alberto Sánchez Molero <com dot gmail at alsamolero>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Kilian Gebhardt <gebhardtkilian at gmail dot com>
# Contributor: Andreas Hauser <andy-aur@splashground.de>
# Contributor: Christoph Drexler <chrdr at gmx dot at>

pkgname=openfst
pkgver=1.8.3
pkgrel=1
pkgdesc='Library for constructing, combining, optimizing, and searching weighted finite-state transducers (FSTs)'
arch=(x86_64)
url='https://www.openfst.org'
license=(Apache)
depends=(gcc-libs glibc)
options=(!libtool !lto)
source=("${url}/twiki/pub/FST/FstDownload/${pkgname}-${pkgver}.tar.gz")
sha256sums=('077714159d5cf3e38a80b6c6656d3ccc2c8b8b6c50bb41bb65c5fec10796bf53')

build() {
  cd $srcdir/$pkgname-$pkgver

  # Options according to http://openfst.cs.nyu.edu/twiki/bin/view/FST/ReadMe
  OPTIONS='--prefix=/usr --disable-dependency-tracking'
  OPTIONS+=' --enable-bin'             # Enable fst::script and command-line binaries;    Default: yes
  OPTIONS+=' --enable-compact-fsts'    # Enable all CompactFst classes;                   Default: no
  OPTIONS+=' --enable-compress'        # Enable compression extension;                    Default: no
  OPTIONS+=' --enable-const-fsts'      # Enable all ConstFst classes;                     Default: no
  OPTIONS+=' --enable-far'             # Enable FAR (FST Archive) extension;              Default: no
  OPTIONS+=' --enable-linear-fsts'     # Enable Linear{Tagger,Classifier}Fst extensions;  Default: no
  OPTIONS+=' --enable-lookahead-fsts'  # Enable LookAheadFst classes;                     Default: no
  OPTIONS+=' --enable-mpdt'            # Enable MPDT extensions;                          Default: no
  OPTIONS+=' --enable-ngram-fsts'      # Enable NGramFst extensions;                      Default: no
  OPTIONS+=' --enable-pdt'             # Enable PDT extensions;                           Default: no
  #OPTIONS+=' --enable-python PYTHON=python'  # Enable Python extensions;                 Default: no
  LIBS='-ldl' ./configure $OPTIONS

  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install

  install -d $pkgdir/etc/ld.so.conf.d/
  echo /usr/lib/fst > $pkgdir/etc/ld.so.conf.d/openfst.conf
}
