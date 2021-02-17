# Maintainer: Brett Cornwall <ainola@archlinux.org>

pkgname=awsume
pkgver=4.5.0
pkgrel=2
pkgdesc="A convenient way to manage AWS session tokens and assume role credentials"
arch=('any')
url="https://awsu.me/"
license=('MIT')
makedepends=(
    'python-setuptools'
    'python-pytest'
    'python-pytest-runner'
)
depends=(
    'python-argcomplete'
    'python-boto3'
    'python-colorama'
    'python-coverage'
    'python-pluggy'
    'python-psutil'
    'python-xmltodict'
    'python-yaml'
)
optdepends=(
    'python-levenshtein: Fuzzy support'
    'python-xmltodict: SAML support'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/trek10inc/awsume/archive/$pkgver.tar.gz")
sha256sums=('3b506e08727400f32886db522477e3ae73d5941266611abbd9a470f3bb17d80b')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

check() {
    cd "$pkgname-$pkgver"
    python setup.py pytest
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"

    rm -f "$pkgdir/usr/bin/awsome.bat"
    rm -f "$pkgdir/usr/bin/awsome.ps1"
}
