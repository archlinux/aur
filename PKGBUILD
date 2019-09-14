# Maintainer: Felice Murolo <linuxboy@giove.tk>
pkgname=libqhttp
pkgver=r232.2cc654a
pkgrel=2
packager=felmur
pkgdesc="HTTP library, managing connections, parsing/building HTTP requests/responses"
arch=('x86_64')
url="https://github.com/azadkuh/qhttp"
license=('MIT')
provides=($pkgname)
conflicts=($pkgname)
depends=('qt5-base')
makedepends=('git')
source=("$pkgname::git+https://github.com/azadkuh/qhttp.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $pkgname
  ./update-dependencies.sh
}

build() {
  cd $pkgname
  qmake -r qhttp.pro
  make -j 8
}

package() {
  cd $pkgname
  #install -D -m755 xbin/libqhttp.so.1.0.0 "$pkgdir/usr/lib/libqhttp.so.1.0.0"
  mkdir -p -v "$pkgdir/usr/lib"
  cp -v -d xbin/libqhttp* "$pkgdir/usr/lib"
  mkdir -p -v "$pkgdir/usr/include/libqhttp"
  cp -v -d example/include/* "$pkgdir/usr/include/libqhttp"
  cp -v -d src/*.hpp "$pkgdir/usr/include/libqhttp"
  
  install -D -m755 xbin/basic-server "$pkgdir/usr/share/libqhttp/xbin/basic-server"
  install -D -m755 xbin/helloworld "$pkgdir/usr/share/libqhttp/xbin/helloworld"
  install -D -m755 xbin/postcollector "$pkgdir/usr/share/libqhttp/xbin/postcollector"
  install -D -m755 README.md LICENSE "$pkgdir/usr/share/libqhttp/"
  
}
 
