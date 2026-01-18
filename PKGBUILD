# Maintainer: dragon <drgn@fn.de>

pkgname=python-pyimgbox
_pkgname=${pkgname#python-}
pkgver=1.0.7
pkgrel=1
pkgdesc='API for uploading images to imgbox.com'
arch=('any')
url="https://codeberg.org/plotski/pyimgbox"
license=('GPL-3.0-only')
depends=(python python-{httpx,beautifulsoup4})
makedepends=(git python-{build,installer,wheel,setuptools})
source=("git+$url#tag=v$pkgver")
sha512sums=('86669d2fd6d699f770c52423e30b529b6611241ab3a55c3193ac1024009dc710d202bf9fa860a08f07794c562805d5082d8172570b5eb82615e50ce1baffb0b0')

build() {
    cd $_pkgname
    python -m build --wheel --no-isolation
}

package() {
    cd $_pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
    rm -rf "$pkgdir/usr/lib/python3."*/site-packages/{tests,docs,build}
}
