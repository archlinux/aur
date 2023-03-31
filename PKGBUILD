# Maintainer: Christian Heusel <christian@heusel.eu>

pkgname=pawxel
pkgver=0.1.2
_tag=1eb8d909cc95e9321d37a63d9f09c7996f321eee
pkgrel=1
pkgdesc='Lightweight screenshot tool for designers & developers'
arch=('x86_64')
url='https://pawxel.rocks/'
license=('GPL3')
makedepends=('git')
depends=('qt5-base' 'qt5-x11extras' 'gtk3' 'libxcb' 'libx11' 'glib2')
source=("git+https://github.com/yeahitsjan/$pkgname.git#tag=$_tag"
        "issue-6.patch")
sha256sums=('SKIP'
            '4465f3dbd5e4c30ae1c236fa6ae56069c72fc094f18c69dd72b87ab39930c4df')

prepare() {
    cd "$pkgname"
    git submodule update --init

    # This can be removed once https://github.com/yeahitsjan/pawxel/issues/6 is
    # resolved and a new version was released
    patch -d "modules/framelesshelper" -p 1 < $srcdir/issue-6.patch
}

build() {
    cd "$pkgname"

    qmake
    make
}

package() {
    cd "$pkgname"
    install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}
