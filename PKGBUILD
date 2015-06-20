# Maintainer: Thiago Yukio Kikuchi Oliveira <stratust@gmail.com>

pkgname=cufflinks
pkgver=2.2.1
pkgrel=1
pkgdesc="Cufflinks assembles transcripts, estimates their abundances, and tests for differential expression and regulation in RNA-Seq samples.."
arch=("x86_64")
url="http://cufflinks.cbcb.umd.edu"
license=('Artistic')
depends=('boost' 'eigen3' 'python2' 'samtools' 'perl')
source=(http://cufflinks.cbcb.umd.edu/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('9a5ba7a7710cd864932cf205c17851f0')

build() {
  cd $srcdir/$pkgname-$pkgver
  # cufflinks use python2 but archlinux uses python3 as default python
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
