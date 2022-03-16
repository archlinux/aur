# Maintainer: brodokk <brodokk at brodokk dot space>

_pkgname=flakehell
pkgname=python-$_pkgname

pkgver=0.9.0
pkgrel=1
pkgdesc="Flake8 wrapper to make it nice, legacy-friendly, configurable."

url='https://flakehell.readthedocs.io/'
arch=('any')
license=('MIT')

depends=('python' 'python-attrs' 'python-entrypoints' 'python-typing-extensions' 'python-termcolor' 'python-flake8-quotes' 'python-pygments' 'python-isort' 'python-pylint' 'python-urllib3' 'flake8' 'python-mccabe' 'python-flake8-commas')
makedepends=(python-build python-installer)

source=("https://github.com/flakehell/$_pkgname/archive/refs/tags/v.$pkgver.tar.gz" "dependencies.patch")
sha512sums=('8733d9cf5b19abf6170104837521e2950deeb5ea334e004ff920b4135a243bc51acbe95e907000f57220fbc7589bbaa43745fec27a6e0405dee08792f5dded79'
            'fea190d4b159b1b5e3b6ec29129723597293029a17feea896e47c3ba1bb1e454808d0163b41b7f50197899969ccf3f0e0b7d68e2a3ab2ce75238ff44185ac45e')

prepare() {
    cd "$_pkgname-v.$pkgver"
    patch --forward --input="${srcdir}/dependencies.patch"
}

build() {
    cd "$_pkgname-v.$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-v.$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

