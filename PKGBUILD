# Maintainer: Antony Jordan <antony.r.jorda at gmail dot com>
pkgname=nanovna-saver-git
pkgver=v0.5.3.r16.g0f19d5a
pkgrel=1
pkgdesc="PC control for the NanoVNA."
arch=(any)
url="https://github.com/mihtjel/nanovna-saver"
license=('GPL3')
depends=(python-pyqt5 python-scipy python-numpy python-pyserial qt5-base)
makedepends=(python-setuptools git)
conflicts=('nanovna-saver')
provides=('nanovna-saver')
source=(
  "$pkgname::git+https://github.com/NanoVNA-Saver/nanovna-saver.git" # Add `#tag=v<version>` to build a specific build, e.g. `#tag=v0.5.3`
  "$pkgname.desktop"
)

md5sums=('SKIP'
         '2b23743a02100506da159231e775fd5a')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    python ./setup.py build
}

package() {
    cd "$pkgname"
    python ./setup.py install --prefix=/usr --root="$pkgdir"
    mkdir -p "$pkgdir/usr/share/pixmaps"
    cp icon_48x48.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
    mkdir -p "$pkgdir/usr/share/applications"
    cd ..
    cp $pkgname.desktop "$pkgdir/usr/share/applications"
}

