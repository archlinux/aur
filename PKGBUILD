pkgname=python-amqpy-git
pkgver=v0.13.1.r3.gc5346b1
pkgrel=2
pkgdesc="Python 3 AMQP 0.9.1 client library"
arch=(any)
url='https://github.com/veegee/amqpy/'
license=(MIT)
makedepends=(git python-setuptools)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=("${pkgname}::git+https://github.com/veegee/amqpy.git")
sha256sums=('SKIP')

pkgver() {
   cd "$srcdir/$pkgname"
   git describe --long | sed 's/\([^-]*-g\)/r\1/;y/-/./'
}

build() {
   cd "$srcdir/$pkgname"
   python setup.py build
}

package() {
   cd "$srcdir/$pkgname"
   python setup.py install --root="$pkgdir" --optimize=1 --skip-build
   install -D -m644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$pkgname"/LICENSE
}
