# Maintainer: Grey Christoforo <first name @ last name .net>

pkgname=cufflinks
pkgver=2.2.1
pkgrel=3
pkgdesc="Cufflinks assembles transcripts, estimates their abundances, and tests for differential expression and regulation in RNA-Seq samples.."
arch=("x86_64")
url="http://cole-trapnell-lab.github.io/projects/cufflinks/"
license=('Artistic')
depends=('boost' 'eigen3' 'python2' 'samtools' 'perl')
source=(https://github.com/cole-trapnell-lab/${pkgname}/archive/v${pkgver}.tar.gz)
md5sums=('80328ff4169f2778c0728a4795da85e2')

build() {
  cd $srcdir/$pkgname-$pkgver
  # cufflinks uses python2 but archlinux uses python3 as default python
  perl -i -pne '$_ =~ s/python/python2/ if $_ =~ /^#!\/usr/' src/cuffmerge

  export EIGEN_CPPFLAGS="-I/usr/include/eigen3"
  export LDFLAGS="-L/usr/lib -lboost_system"
  ./configure --prefix=/usr
  make

}

package() {
	  cd "$srcdir/$pkgname-$pkgver"
	  make DESTDIR="$pkgdir/" install
}
