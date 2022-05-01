pkgname=princeprocessor-git
pkgver=v0.22.r4.ge4e7d89
pkgrel=1
pkgdesc="Standalone password candidate generator using the PRINCE algorithm."
arch=('i686' 'x86_64')
url="https://github.com/hashcat/princeprocessor"
license=('MIT')
makedepends=('git' 'make')
provides=('princeprocessor')
source=(git+https://github.com/hashcat/princeprocessor.git)
md5sums=('SKIP')

_gitroot='https://github.com/hashcat/princeprocessor.git'
_gitname='princeprocessor'

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname/src"

  if [ "$CARCH" == "x86_64" ]
  then
    make pp64.bin
  elif [ "$CARCH" == "i686" ]
  then
    make pp32.bin
  fi
}

package() {
  cd "$srcdir/$_gitname/src"

  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mkdir -p "$pkgdir/usr/bin/"

  cp ./*.bin "$pkgdir/usr/bin/"

  cd  "$pkgdir/usr/bin/"
  i=$(ls ".")
  chmod +x $i
  mv $i pp
}

# vim:set ts=2 sw=2 et:
