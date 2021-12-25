# Maintainer: Michael J. Pento <mjpento@verizon.net>

pkgname=urho3d
pkgver=1.7.1
pkgrel=1
pkgdesc="Urho3D is a free lightweight, cross-platform 2D and 3D game engine implemented in C++ and released under the MIT license."
arch=('i686' 'x86_64')
url="http://urho3d.github.io"
license=('MIT')
depends=("libx11" "libgl" "libxrandr")
makedepends=('cmake')
conflicts=("$pkgname-git")
replaces=("$pkgname-git")
provides=("$pkgname=$pkgver")
source=("https://github.com/urho3d/Urho3D/archive/$pkgver.tar.gz")
md5sums=('ce82887578fdb36c56296783b8450680')
sha1sums=('022ac959ef998a28ed4de7968ed9672204977034')
install=urho3d.install

build() {
    mkdir -p "$srcdir/Urho3D-$pkgver/build"
    cd "$srcdir/Urho3D-$pkgver/build"
    cmake "$srcdir/Urho3D-$pkgver/" -DCMAKE_INSTALL_PREFIX="/usr" -DURHO3D_USE_LIB_DEB=1 -DURHO3D_SAMPLES=1
    make
}

package() {
    cd "$srcdir/Urho3D-$pkgver/build"
    make DESTDIR="$pkgdir/" install
    cd "$pkgdir/usr/bin"
    mv "./Editor.sh" "./urho3d-editor.sh"
    rm lua luac
}
