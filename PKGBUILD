# Maintainer: Nick Logozzo <nlogozzo225@gmail.com>
_name=nickvision-tagger
pkgname=$_name
pkgver=2022.5.5
pkgrel=1
pkgdesc="An easy-to-use music tag (metadata) editor"
arch=(x86_64)
url="https://github.com/nlogozzo/NickvisionTagger"
license=(GPL3)
depends=(gtk4 libadwaita jsoncpp libcurlpp taglib libmusicbrainz5)
makedepends=(git cmake)
provides=($_name)
conflicts=($_name)
source=("git+https://github.com/nlogozzo/NickvisionTagger.git")
md5sums=("SKIP")

prepare() {
    mkdir -p build
    cd $srcdir/NickvisionTagger
    git checkout -q d056dd9
    git submodule init
    git submodule update
}

build() {
	cd build
    cmake $srcdir/NickvisionTagger \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    make
}

package() {
	cd build
	make DESTDIR="$pkgdir/" install
    sudo touch /usr/share/icons/hicolor ~/.local/share/icons/hicolor
    sudo gtk-update-icon-cache
}