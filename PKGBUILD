# Contributor (Arch): maz-1 <loveayawaka[at]gmail[dot]com>
# Maintainer: André Silva <emulatorman@parabola.nu>

pkgname=b43-tools
pkgver=019
pkgrel=1
pkgdesc="Tools for the Broadcom 43xx series WLAN chip"
arch=('i686' 'x86_64')
url="https://github.com/mbuesch/b43-tools"
license=('GPL2' 'GPL3')
depends=('python2')
makedepends=('bison' 'flex' 'python2')
provides=('b43-fwcutter')
conflicts=('b43-fwcutter')
source=("https://github.com/mbuesch/b43-tools/archive/b43-fwcutter-019.tar.gz")
md5sums=('d8387ec57b8bced796b0f9231077501a')

build() {
  cd "$srcdir/b43-tools-b43-fwcutter-$pkgver"

  sed -i -e 's/\/man\//\/share\/man\//g' fwcutter/Makefile

  make -C assembler
  make -C disassembler
  make -C fwcutter
  make -C ssb_sprom
}

package() {
  cd $srcdir/b43-tools-b43-fwcutter-$pkgver/debug/; python2 install.py install --root "$pkgdir/"; cd ..

  make -C assembler PREFIX="$pkgdir/usr/" install
  make -C disassembler PREFIX="$pkgdir/usr/" install
  make -C fwcutter PREFIX="$pkgdir/usr/" install
  make -C ssb_sprom PREFIX="$pkgdir/usr/" install
} 
