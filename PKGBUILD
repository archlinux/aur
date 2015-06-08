# Maintainer: Giorgio Wicklein <giowckln@gmail.com>
pkgname=symphytum
pkgver=1.2
pkgrel=1
pkgdesc="Personal database software"
arch=('i686' 'x86_64')
url="http://giowck.github.io/symphytum/"
license=('BSD')
depends=('qt4' 'sqlite' 'python2' 'python2-setuptools')
source=("http://giowck.github.io/symphytum/files/$pkgname-$pkgver-src.tar.gz"
        "http://giowck.github.io/symphytum/files/$pkgname-$pkgver-src.tar.gz.asc")
md5sums=('e35e8c1eee7f3343ed8007974272efda'
         'SKIP')

build() {
  qmake-qt4 -config release
  make
}

package() {
  cd "$srcdir"

  # Binary
  install -Dm755 "$srcdir/symphytum" "${pkgdir}/usr/bin/symphytum"

  # Icons and desktop files
  install -d "${pkgdir}/usr/share/"
  cp -R "$srcdir/stuff/installers/deb/usr/share/applications/" "${pkgdir}/usr/share/"
  cp -R "$srcdir/stuff/installers/deb/usr/share/pixmaps/" "${pkgdir}/usr/share/"

  # Sync framework files
  install -d "${pkgdir}/usr/share/symphytum/"
  cp -R "$srcdir/stuff/installers/deb/usr/share/symphytum/" "${pkgdir}/usr/share/"

  # Copy license
  install -Dm644 "$srcdir/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
