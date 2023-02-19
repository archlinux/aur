# -*- shell-script -*-
# Maintainer: Albert Graef <aggraef at gmail dot com>

pkgname=pd-else-git
pkgver=v1.0.rc6.r146.g024732cb
pkgrel=1
pkgdesc="ELSE externals for Pd, git version"
arch=("i686" "x86_64")
license=('WTFPL')
url="https://github.com/porres/pd-else"
depends=('pd' 'fluidsynth')
provides=('pd-else')
conflicts=('pd-else')
source=("git+https://github.com/porres/pd-else.git"
	"git+https://github.com/pure-data/pure-data.git")
md5sums=('SKIP' 'SKIP')

pkgver() {
    cd $srcdir/pd-else
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $srcdir/pd-else
    make all sfont plaits pdincludepath=$srcdir/pure-data/src
}

package() {
    cd $srcdir/pd-else
    make DESTDIR="$pkgdir" PDLIBDIR=/usr/lib/pd/extra install sfont-install plaits-install
    install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
