# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: jfperini <@jfperini>

pkgname=knowthelist-git
pkgver=2.3.1.r3.g32ec9a3
pkgrel=1
pkgdesc="Knowthelist the awesome party music player."
url="https://github.com/knowthelist/knowthelist"
license=('GPL v2')
arch=('any')
depends=('qt5-base' 'taglib' 'gstreamer' 'gst-plugins-base' 'boost' 'alsa-lib')
makedepends=('git' 'qt5-tools')
conflicts=('knowthelist')
provides=('knowthelist')
source=("$pkgname"::'git+https://github.com/knowthelist/knowthelist')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # cutting off 'v' prefix that presents in the git tag
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
    
  qmake-qt5 knowthelist.pro
  make
      
}

package() {
  cd "$srcdir/$pkgname"
      
  install -d $pkgdir/{usr/bin,usr/share}
  cp -u "./knowthelist" "$pkgdir/usr/bin"

  install -Dm644 "./dist/knowthelist.png" "$pkgdir/usr/share/pixmaps/knowthelist.png"
      
  install -Dm644 "./dist/knowthelist.desktop" "$pkgdir/usr/share/applications/knowthelist.desktop"
      
}

# vim: ts=2 sw=2 et:
