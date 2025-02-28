pkgname=ezflashcli
pkgver=1.0.28
pkgrel=2
pkgdesc="Command line tools to manage flash devices connected to the Dialog Smartbond™ device family"
arch=('any')
url="https://github.com/ezflash/ezFlashCLI"
license=('MIT')
depends=('python' 'python-pyserial')
makedepends=('git' 'python-setuptools')
source=("https://github.com/ezflash/ezFlashCLI/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c44803939a87bb8a83b5e5bb5f4eb3850076cf0b61b035d83cdd4a69e39a76c3')

build() {
    cd "$srcdir/ezFlashCLI-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/ezFlashCLI-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Fix versioning and remove deprecated setup options
prepare() {
    cd "$srcdir/ezFlashCLI-$pkgver"
    sed -i 's/"pyserial"/"pyserial==3.5"/' setup.py
    sed -i '/test_suite/d' setup.py
    sed -i '/tests_require/d' setup.py
    sed -i 's/version = ezFlashCLI.get_version_from_git()/version = "1.0.28"/' setup.py
}
