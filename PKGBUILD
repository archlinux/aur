# Maintainer: Daniel Sandman <revoltism@gmail.com>

pkgname=haveclip-desktop-git
pkgver=0.0.0
pkgrel=1
pkgdesc="A simple clipboard manage and synchronization tool (client pkg)"
arch=('i686' 'x86_64')
url="http://www.havefun.cz/projects/haveclip/"
license=('GPL')
depends=('qt4' 'haveclip-core-git')
makedepends=('make' 'gcc' 'xproto' 'qca' 'qca-ossl')
conflicts=('haveclip' 'haveclip-desktop-git')
provides=('haveclip-desktop')
source=("$pkgname"::'git+https://github.com/aither64/haveclip-desktop.git#branch=master'
       'haveclip.desktop'
       'haveclip.png')
md5sums=('SKIP' 
        '5b23858fd7e2f11bd312464331d481c8'
        '383970eb2d819d67e96623bb8b0b33a4')

pkgver() {
     cd "$srcdir/$pkgname"
     git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}


build() {
  cd "$srcdir/$pkgname/"
  git clone https://github.com/aither64/haveclip-core.git
  cd "haveclip-desktop/"
  /usr/lib/qt4/bin/qmake
  make || return 1
}

package() {
  install -Dm644 haveclip.desktop "$pkgdir/usr/share/applications/haveclip.desktop"
  install -Dm644 haveclip.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/haveclip.png"
  cd "$srcdir/$pkgname/bin/"
  install -Dm755 haveclip "$pkgdir/usr/bin/haveclip"
}

