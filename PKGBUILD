# Maintainer: M Rawash <mrawash@gmail.com>
pkgname=notion-git
pkgver=3.2017050501.r16.g7260b922
pkgrel=1
pkgdesc='Tabbed tiling, window manager. Fork of Ion3 - git version'
arch=('i686' 'x86_64')
url='http://notion.sourceforge.net/'
license=('custom:LGPL')
depends=('glib2' 'lua' 'libxext' 'libsm' 'gettext')
optdepends=('libxinerama' 'libxrandr')
makedepends=('git')
provides=('libtu' 'libextl' ${pkgname%-git})
conflicts=(${pkgname%-git})
source=("$pkgname::git+https://github.com/raboof/notion.git#branch=master")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    export PREFIX=/usr
    export ETCDIR=/etc/notion
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir/" install
    cp -R contrib "$pkgdir/usr/share/"
}
