# Maintainer: Giorgio Wicklein <giowckln@gmail.com>
pkgname=symphytum
pkgver=2.0
pkgrel=1
pkgdesc="Personal database software"
arch=('i686' 'x86_64')
url="http://giowck.github.io/symphytum/"
license=('BSD')
depends=('qt5-base' 'qt5-svg' 'sqlite' 'python2' 'python2-setuptools')
source=("http://giowck.github.io/symphytum/files/$pkgname-$pkgver-src.tar.gz")
md5sums=('5dc01191d4434bc956c8866a36eff277')

build() {
  qmake-qt5 -config release
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

