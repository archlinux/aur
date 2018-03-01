# Maintainer: Josh Marshall <jrmarsha@mtu.edu>
# Contributor: Michael Schubert <mschu.dev at gmail>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=hmmer3-2
pkgver=3
pkgrel=1
_hmmer3_pkgver=3.1b2
_hmmer2_pkgver=2.4i
pkgdesc="Profile hidden Markov models (HMMs) for database searching using consensus sequences containing the version 2 and 3 implementations."
arch=('i686' 'x86_64')
license=('GPL')
url="http://hmmer.org/"
depends=('glibc')
makedepends=('glibc' 'make' 'bash' 'perl' 'perl-perl4-corelibs')
provides=('hmmer' 'hmmer2')
conflicts=('hmmer' 'hmmer2')
source=("http://eddylab.org/software/hmmer3/$_hmmer3_pkgver/hmmer-$_hmmer3_pkgver.tar.gz"
        "http://eddylab.org/software/hmmer/$_hmmer2_pkgver/hmmer-$_hmmer2_pkgver.tar.gz")
md5sums=('c8c141018bc0ccd7fc37b33f2b945d5f'
         'dab234c87e026ac1de942450750acd20')

build() {
  cd "$pkgname-$_hmmer2_pkgver"
  ./configure --prefix=/usr --program-suffix=2 --docdir=/usr/share/doc/hmmer2
  make

  cd "../$pkgname-$_hmmer3_pkgver"
  ./configure --prefix=/usr --docdir=/usr/share/doc/hmmer
  make
}

check() {
  cd "$pkgname-$_hmmer2_pkgver"
  make check  

  cd "../$pkgname-$_hmmer3_pkgver"
  make check
}

package() {
  cd "$pkgname-$_hmmer2_pkgver"
  make prefix="$pkgdir/usr" install

  cd "../$pkgname-$_hmmer3_pkgver"
  make prefix="$pkgdir/usr" install
}
