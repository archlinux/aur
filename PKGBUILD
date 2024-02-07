# Maintainer: Enzo Einhorn <enzo.einh@gmail.com>

pkgname=gnome-extensions-cli
_pkgname=gnome_extensions_cli
commithash=5f3d0ed203f3d1df491e55d190b59298587f5198
pkgver=0.10.0
pkgrel=1
pkgdesc="Install, update and manage your Gnome Shell extensions from your terminal !"
arch=("any")
url="https://github.com/essembeh/$pkgname"
license=("Apache")
makedepends=(python-installer python-poetry)
depends=(python python-colorama python-pydantic python-requests python-packaging)
optdepends=("dbus: recommended, handle extensions with DBus")
source=("https://github.com/essembeh/$pkgname/archive/$commithash.zip")
sha256sums=("a71ecdd1e47b10eaef7097fbf95e3aa58fe79f6595db433a4b3d8e92ff0a068c")

build() {
    cd $pkgname-$commithash
    poetry build
}

package() {
    cd "$srcdir/$pkgname-$commithash/dist"
    python -m installer --destdir="$pkgdir" *.whl
}
