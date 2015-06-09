# Maintainer:  Eric Biggers <ebiggers3@gmail.com>

pkgname=blat
pkgver=35
pkgrel=1
pkgdesc="The BLAST-like Alignment Tool: fast sequence search command line tool"
arch=('i686' 'x86_64')
url="http://genome.ucsc.edu/FAQ/FAQblat.html"
license=('custom')
source=('http://users.soe.ucsc.edu/~kent/src/blatSrc35.zip')

_set_machtype() {
  if [ $arch = 'i686' ]; then
    _machtype=i386
  else
    _machtype=x86_64
  fi
}

build() {
  cd blatSrc
  _set_machtype
  _destdir=`mktemp -d`
  mkdir $_destdir/bin
  make DESTDIR="$_destdir/" BINDIR=bin MACHTYPE=$_machtype 
}

package() {
  cd blatSrc
  _set_machtype
  mkdir -p $pkgdir/usr/bin
  make DESTDIR="$pkgdir/usr/" BINDIR=bin MACHTYPE=$_machtype 
  install -Dm644 README ${pkgdir}/usr/share/licenses/${pkgname}/README
}

md5sums=('16e546b8843b85e0b0f2fa603cd78724')
