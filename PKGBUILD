# Maintainer: Sid <sidpranjale127@protonmail.com>

pkgname=streamcontrol-git
pkgver=r213.c29caea
pkgrel=1
pkgdesc='App to control overlay data for Fighting Game livestreams'
arch=('i686' 'x86_64' 'aarch64')
url='http://farpnut.net/streamcontrol/'
license=('custom')
makedepends=('qt5-script' 'make')
provides=('streamcontrol')
conflicts=('streamcontrol')
source=('git+https://github.com/farpenoodle/StreamControl.git'
        'streamcontrol.desktop')
sha256sums=('SKIP'
            'c91d6fc98df74304f3efea80fbd53147eca54e5e5813857fa60e268821abf684')

pkgver() {
    cd $srcdir/StreamControl/StreamControl
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd StreamControl/StreamControl
    qmake
    make
}

package() {
    cd StreamControl/StreamControl
    install -D -t "$pkgdir"/usr/bin StreamControl
    install -D -t "$pkgdir"/usr/share/applications -m 644 "$srcdir"/streamcontrol.desktop
}
