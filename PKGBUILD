# Maintainer: M Rawash <mrawash@gmail.com>
pkgname=notion-git
pkgver=3.2015061300.r55.3ae6b5f7
pkgrel=1
pkgdesc='Tabbed tiling, window manager. Fork of Ion3 - git version'
arch=('i686' 'x86_64')
url='http://notion.sourceforge.net/'
license=('custom:LGPL')
depends=('glib2' 'lua' 'libxext' 'libsm' 'gettext')
optdepends=('libxinerama' 'libxrandr')
makedepends=('git')
provides=('libtu' 'libextl' 'notion')
conflicts=('notion')
source=('notion::git+https://github.com/raboof/notion.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/notion"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "$srcdir/notion"
    export PREFIX=/usr
    export ETCDIR=/etc/notion
    make
}

package() {
    cd "$srcdir/notion"
    make DESTDIR="$pkgdir/" install
}
