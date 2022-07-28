# Maintainer: Max Gautier <mg@max.gautier.name>
pkgname=all-repos
pkgver=1.23.0
pkgrel=2
pkgdesc="Clone all your repositories and apply sweeping changes"
arch=(any)
url="https://github.com/asottile/all-repos"
license=('MIT')
depends=(python-identify python-setuptools)
optdepends=(
        'python-pre-commit: for pre-commit autofixer'
        'python-yaml: for autofixer on yaml files (pre-commit, azure pipelines)'
)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('5ecba787dfbacd45632cfcba53ab01a1d81a52633ceb7555a0f81d1325fdcc70')

build() {
    cd "${pkgname//-/_}-$pkgver"
    python setup.py build
}

package() {
    cd "${pkgname//-/_}-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
