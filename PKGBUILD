# Maintainer: f4iey <f4iey@f4iey.fr>

pkgname=cloudlogcatqt-git
pkgver=r45.c067920
pkgrel=1
pkgdesc="Qt app (Linux, Windows, Mac) for providing CAT support for Cloudlog"
arch=('any')
license=('GPL3')
url="https://github.com/myzinsky/CloudLogCatQt"
makedepends=(git)
depends=(
qt5-base
)
optdepends=(flrig)
source=(
	$pkgname::"git+$url.git"
)
sha256sums=('SKIP')

prepare(){
    git -C "$srcdir/$pkgname" clean -dfx
}

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
    cd "$srcdir/$pkgname"
    mkdir build
    cd build
    qmake ../CloudLogCatQt.pro
    make
}

package() {
  cd $srcdir/$pkgname/build
  install -Dm755 CloudLogCatQt $pkgdir/usr/bin/CloudLogCatQt
}
