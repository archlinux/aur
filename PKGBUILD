pkgname=urho3d
pkgver=1.4
pkgrel=3
pkgdesc="Urho3D is a free lightweight, cross-platform 2D and 3D game engine implemented in C++ and released under the MIT license."
arch=('i686' 'x86_64')
url="http://urho3d.github.io"
license=('MIT')
depends=("libx11" "libgl" "libxrandr")
makedepends=('cmake')
conflicts=("$pkgname-git")
replaces=("$pkgname-git")
provides=("$pkgname=$pkgver")
source=("https://github.com/urho3d/Urho3D/archive/1.4.tar.gz")
md5sums=('0eaf743ce192f63ba3580c9b5d30ef3b')
sha1sums=('dfcf0c8623b9fc89998bf9f3b8f18244f079cfb9')
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
}
