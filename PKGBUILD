# Maintainer: Miodrag Tokić
# Contributor: Quentin Retornaz <quentin dot retornaz at yahoo dot fr>
# Contributor: Manuel Kehl <https://launchpad.net/~mank319, https://github.com/mank319/>

pkgname=go-for-it
pkgver=1.9.4
pkgrel=1
pkgdesc='A stylish to-do list with built-in productivity timer.'
arch=('i686' 'x86_64')
url='https://github.com/JMoerman/Go-For-It'
license=('GPL3')
depends=('gtk3' 'libnotify')
optdepends=(
    'libpeas: plugin support'
    'libappindicator-gtk3: Ayatana appindicator plugin support'
)
makedepends=('vala' 'cmake')
conflicts=('go-for-it-git')
install='go-for-it.install'
source=("$pkgname-$pkgver.tar.gz::https://github.com/JMoerman/Go-For-It/archive/${pkgver}.tar.gz")
sha256sums=('2060875838a09c784b3e22b750325bc77a91c5cf0c0da7bc38f1939e04d2a30a')

build() {
    cd "Go-For-It-$pkgver"

    if [[ -d build ]]; then
        rm -rf build
    fi

    mkdir build && cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    cd "Go-For-It-$pkgver/build"
    make DESTDIR="$pkgdir" install

    install -D -m 644 "$pkgdir/usr/share/applications/com.github.jmoerman.go-for-it.desktop" "$pkgdir/usr/share/applications/go-for-it.desktop"
    sed -i "4i NoDisplay=true" "$pkgdir/usr/share/applications/com.github.jmoerman.go-for-it.desktop"
}
