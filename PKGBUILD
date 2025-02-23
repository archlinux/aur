# Maintainer: Groctel <aur@taxorubio.com>
# shellcheck disable=SC2034,SC2154,SC2164

_name=cloup

pkgname=python-cloup
pkgver=3.0.6
pkgrel=1
pkgdesc="Cloup (= Click + groups) contains a set of Click extensions for multiple purposes."

arch=("any")
license=("MIT")
url="https://github.com/janLuke/cloup"

source=("https://github.com/janLuke/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('6a936868127557f35c9accf216ed00f8fd19f40f64fa8a986f73ea58cb83545cfb8a6bac1101b4b9811c2b280b50a0ff1bc9fa58b553f9279056768d22825fec')

depends=(
    "python"
    "python-click"
    "python-typing_extensions"
)
makedepends=(
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-setuptools-scm"
    "python-wheel"
)
checkdepends=(
    "python-pytest"
)

build () {
    cd "$srcdir/$_name-$pkgver"
    SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver} \
        python -m build --wheel --no-isolation
}

check () {
    cd "$srcdir/$_name-$pkgver"
    pytest
}

package () {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_name/LICENSE"
}
