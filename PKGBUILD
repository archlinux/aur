# Maintainer: Christian Heusel <christian@heusel.eu>

pkgname=pawxel-git
_pkgname=${pkgname%-git}
pkgver=0.1.3.r1.g793918b
pkgrel=1
pkgdesc='Lightweight screenshot tool for designers & developers'
arch=('x86_64')
url='https://pawxel.rocks/'
license=('GPL3')
makedepends=('git')
depends=('qt5-base' 'qt5-x11extras' 'gtk3' 'libxcb' 'libx11' 'glib2')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/yeahitsjan/pawxel.git"
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
    cd "$_pkgname"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"

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
    cd "$_pkgname"

    qmake
    make
}

package() {
    cd "$_pkgname"
    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
