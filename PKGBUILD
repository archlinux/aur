# Maintainer: Alesh Slovak <aleshslovak at gmail dot com>

pkgname=python-gbopyrator
_name=${pkgname#python-}
pkgver=0.5
pkgrel=3
pkgdesc="A command line tool and library for the GB Operator"
arch=('any')
url="https://github.com/N0ciple/gbopyrator"
license=('MIT')
depends=('python' 'python-setuptools' 'python-rich' 'python-pyusb' 'python-crccheck')
source=(
"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
"70-gboperator.rules"
)
b2sums=(
'6d038961549071ab96e61dc748e9ea79df2f0c3dc2e03cc0b20c558988507d484f29b497c0e2aef220f94e086978fccdd6504fed2204e2215b83902da3669055'
'SKIP'
)

build() {
        cd "$srcdir/$_name-$pkgver"
        python setup.py build
}
package() {
        cd "$srcdir/$_name-$pkgver"
        python setup.py install --root="$pkgdir" --prefix=/usr --skip-build
        mkdir -p "$pkgdir/usr/lib/udev/rules.d"
        install -m 644 "$srcdir/70-gboperator.rules" "$pkgdir/usr/lib/udev/rules.d/70-gboperator.rules"
}
