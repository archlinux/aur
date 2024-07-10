pkgname="python-tlsfuzzer-git"
pkgver=r1732.731b70b
pkgrel=1
pkgdesc='TLS test suite and fuzzer'
arch=('any')
url='https://github.com/tomato42/tlsfuzzer'
makedepends=('python-setuptools')
depends=('python')
license=('GPL2')
source=('git+https://github.com/tomato42/tlsfuzzer.git')
md5sums=('SKIP')

pkgver() {
  cd tlsfuzzer
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/tlsfuzzer"
    python setup.py build
}

package() {
    cd "$srcdir/tlsfuzzer"
    python setup.py install --root="$pkgdir/" --optimize=1

    # uncomment to include documentation
    #mkdir -p "$pkgdir/usr/share/doc/tlsfuzzer"
    #cp "$srcdir/tlsfuzzer/docs/"*pdf "$pkgdir/usr/share/doc/tlsfuzzer/"

    # example scripts
    mkdir -p "$pkgdir/usr/lib/tlsfuzzer/examples"
    cp "$srcdir/tlsfuzzer/scripts"/* "$pkgdir/usr/lib/tlsfuzzer/examples/"
}
