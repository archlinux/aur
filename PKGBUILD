# Maintainer: Patrick Griffis <tingpign@tingpng.se>
# Contributor: Sam Day <me@samcday.com>

_modname='gbulb'
pkgname='python-gbulb'
pkgver=0.6.1
pkgrel=1
pkgdesc='Implmementation of asyncio using GLib'
arch=('any')
url='https://github.com/nathan-hoad/gbulb'
license=('Apache')
makedepends=('python-setuptools')
depends=('python-gobject')
optdepends=('gtk3: Gtk application integration')
checkdepends=('python-pytest')
source=("https://github.com/nathan-hoad/gbulb/archive/$pkgver.tar.gz" 0001-fixes.patch)
sha256sums=('ab9dbde5d92a2b4f13c7acc9afc7235081a5c999d6807b049e2d8c2ef26c03a9'
            '42fe5793da6645c0ad9c1147dd4842ba6aa29c3536ffb5165a78f33a376b7e65')

check() {
    cd "$_modname-$pkgver"
	cat ../0001-fixes.patch | patch -s -F0 -E -p1
    python -m pytest ./tests
}

package() {
    cd "$_modname-$pkgver"

    python ./setup.py install --prefix=/usr --root="$pkgdir" --optimize=2
}
