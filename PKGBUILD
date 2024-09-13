# Maintainer: Max Gautier <mg@max.gautier.name>
pkgname=all-repos
pkgver=1.27.0
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
sha256sums=('96fea3e34caa004b0770501e6efb93dc49cbca05fb56c2b8b2a85d06fb3a4573')

build() {
    cd "${pkgname//-/_}-$pkgver"
    python setup.py build
}

package() {
    cd "${pkgname//-/_}-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
