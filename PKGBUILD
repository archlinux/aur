#Maintainer: jnanar <info@agayon.be>

pkgname=python-shortuuid-git
pkgver=v1.0.10.r16.g0b48734
pkgrel=1
pkgdesc="shortuuid is a simple python library that generates concise, unambiguous, URL-safe UUIDs."
arch=(any)
url="https://github.com/skorokithakis/shortuuid"
license=('BSD')
depends=('python')
makedepends=(python-{build,installer,wheel}
             python-poetry-core)
options=(!emptydirs)
provides=('python-shortuuid')
conflicts=('python-shortuuid')

source=('git+https://github.com/skorokithakis/shortuuid.git')
_gitname="shortuuid"
md5sums=('SKIP')


pkgver() {
  cd $_gitname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_gitname"
        poetry build
}

check() {
    cd "$srcdir/$_gitname"
    python -m unittest discover
}

package() {
    cd "$srcdir/$_gitname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING
}
