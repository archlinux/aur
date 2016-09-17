# Contributor: Fincer <fincer89 at hotmail dot com>
pkgname=zdl
pkgver=3.2.2.3
pkgrel=2
pkgdesc="A feature rich Doom launcher for ZDoom and GZDoom (Recommended Beta)"
url="http://zdl.vectec.net"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt4')
makedepends=('gdb' 'make' 'imagemagick')
optdepends=('gzdoom' 'zdoom')

source=(https://github.com/qbasicer/qzdl/archive/v${pkgver}.tar.gz)
md5sums=('50e61034d288d57ab3aecbd03dcf946a')

build() {
  cd "$srcdir/q$pkgname-${pkgver}/"
  
  export QT_SELECT=4
  ./configure --prefix=/usr --disable-updater      
  
  make
  
  convert "res/ico_icon.ico[2]" ./zdl.png

  printf "[Desktop Entry]\nEncoding=UTF-8\nName=ZDL Doom Launcher\nGenericName=Doom launcher\nComment=A feature rich Doom launcher for ZDoom and GZDoom\nExec=zdl\nIcon=zdl\nTerminal=false\nType=Application\nCategories=Game;\nStartupNotify=true\n" > zdl.desktop

}

package() {
  mkdir -p "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/usr/share/pixmaps/"
  mkdir -p "$pkgdir/usr/share/applications/"
  install $srcdir/q$pkgname-${pkgver}/zdl "$pkgdir"/usr/bin/zdl
  install $srcdir/q$pkgname-${pkgver}/$pkgname.desktop "$pkgdir/usr/share/applications/"
  install $srcdir/q$pkgname-${pkgver}/$pkgname.png "$pkgdir/usr/share/pixmaps/"  
}
