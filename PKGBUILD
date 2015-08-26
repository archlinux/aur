# Maintainer: David Manouchehri <d@32t.ca>
# Former Maintainer: Peter-Paul van Gemerden <info@ppvg.nl>
# Contributor: Karsten Hinz <k.hinz@tu-bs.de>

pkgname=pycam
pkgver=0.5.1
pkgrel=4
pkgdesc="Toolpath generator for 3-axis CNC machining, written in Python."
arch=('i686' 'x86_64')
url="http://pycam.sourceforge.net/"
license=('GPL3')
depends=('python2' 'python2-opengl' 'python2-rsvg' 'python2-gtkglext' 'pstoedit')
optdepends=('psyco')
options=()
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz"
        memoryfix.patch{,.sig})
sha512sums=('f880d960f82eb374465a593f3b27e9f72148b3ceb99fde15bee4ccf1078acc8ef44ddfd9ee12f89e5b5e5ee14706b6e5d76eff7d0334c9526866ff263a057994'
            'fe6720e0afc2018ce16c37bacf6e905c3e4396c74759da600bd0f8268c6dca695d08da904b40816e43c84587e0812d599a1f61eaead02b8f739a6b467c473f09'
            'SKIP')

build() {
  cd $srcdir/$pkgname-$pkgver/
  patch -p1 -i $srcdir/memoryfix.patch
}

package() {
  
  mkdir -p "$pkgdir/usr/share/"
  cp -R "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/share/$pkgname"

  mkdir -p "$pkgdir/usr/bin/"
  echo -e "#! /bin/sh\npython2 /usr/share/$pkgname/$pkgname" > "$pkgdir/usr/bin/$pkgname"
  chmod a+x "$pkgdir/usr/bin/$pkgname"

  # Thanks to Karsten for these additions
  # install some freedesktop.org compatibility
  install -D -m644 "$srcdir/$pkgname-$pkgver/share/desktop/pycam.desktop" \
        "$pkgdir/usr/share/applications/pycam.desktop"

  #install -Dm644 "$srcdir/$pkgname-$pkgver/share/mime/icons/32x32/application-sla.png" "$pkgdir/usr/share/pixmaps/pycam.png"
  install -Dm644 "$srcdir/$pkgname-$pkgver/share/mime/application-sla.svg" "$pkgdir/usr/share/pixmaps/pycam.svg"

  install -Dm644 "$srcdir/$pkgname-$pkgver/share/mime/pycam.xml" "$pkgdir/usr/share/mime/application/pycam.xml"

}
