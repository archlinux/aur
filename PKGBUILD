# Maintainer: Max Gautier <mg@max.gautier.name>
pkgname=all-repos
pkgver=1.25.0
pkgrel=1
pkgdesc="Clone all your repositories and apply sweeping changes"
arch=(any)
url="https://github.com/asottile/all-repos"
license=('MIT')
depends=(python-identify python-setuptools)
optdepends=(
        'python-pre-commit: for pre-commit autofixer'
        'python-yaml: for autofixer on yaml files (pre-commit, azure pipelines)'
        'jq: all-repos-complete'
)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('06fdef4b4d0984c79b1887e012e8c90e03ddea0273ac692d4127ba44c6b34d99')

build() {
    cd "${pkgname//-/_}-$pkgver"
    python setup.py build
}

package() {
    cd "${pkgname//-/_}-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
