# Maintainer: Christian Heusel <christian@heusel.eu>

pkgname=pawxel
pkgver=0.1.4
_tag=521526e9d29f4b830ab3d20de531168ff406a828
pkgrel=1
pkgdesc='Lightweight screenshot tool for designers & developers'
arch=('x86_64')
url='https://pawxel.rocks/'
license=('GPL3')
makedepends=('git')
depends=('qt5-base' 'qt5-x11extras' 'gtk3' 'libxcb' 'libx11' 'glib2')
source=("git+https://github.com/yeahitsjan/pawxel.git#tag=$_tag"
        "git+https://github.com/yeahitsjan/phantomstyle.git"
        "git+https://github.com/yeahitsjan/easyloggingpp.git"
        "git+https://github.com/yeahitsjan/SingleApplication.git"
        "git+https://github.com/yeahitsjan/QHotkey.git"
        "git+https://github.com/yeahitsjan/resizer-item.git"
        "git+https://github.com/yeahitsjan/FHNotifier.git"
        "git+https://github.com/yeahitsjan/framelesshelper.git#branch=qmake_mods")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    cd "${pkgname}"
    git describe --tags | sed 's/^[vV]//;s/-/+/g'
}

prepare() {
    cd "$pkgname"
    git submodule init

    git config submodule.modules/phantomstyle.url "$srcdir/phantomstyle"
    git config submodule.modules/easyloggingpp.url "$srcdir/easyloggingpp"
    git config submodule.modules/SingleApplication.url "$srcdir/SingleApplication"
    git config submodule.modules/QHotkey.url "$srcdir/QHotkey"
    git config submodule.modules/resizer-item.url "$srcdir/resizer-item"
    git config submodule.modules/FHNotifier.url "$srcdir/FHNotifier"
    git config submodule.modules/framelesshelper.url "$srcdir/framelesshelper"

    git -c protocol.file.allow=always submodule update
}

build() {
    cd "$pkgname"

    qmake
    make
}

package() {
    cd "$pkgname"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
