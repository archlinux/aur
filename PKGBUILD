# Maintainer: Michal Babik <michal.babik@protonmail.com>

pkgname=wallchanger
pkgver=1.7.3
pkgrel=1
pkgdesc="Automatic wallpaper changer"
arch=('i686' 'x86_64' 'aarch64')
url="https://www.nongnu.org/wallchanger/"
license=('GPL-3.0-or-later')
depends=('glibc' 'glib2' 'gdk-pixbuf2' 'gtk3>=3.22.0' 'json-c>=0.12.1'
         'curl>=7.68.0' 'flickcurl>=1.24')
makedepends=('cmake>=3.22' 'ninja' 'pkgconf' 'gcc>=13' 'bash-completion')
checkdepends=('check>=0.15.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mi-bb/wallchanger/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e5e3f74193a36550d8ac3a402785d9a8bb407954ba235c0c78fb776033a1df02')

build() {
    cmake -S "$pkgname-$pkgver" -B build -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None \
        -DWITH_FLICKR=ON \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
