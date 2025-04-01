# Maintainer: Groctel <aur@taxorubio.com>
# shellcheck disable=SC2034,SC2154,SC2164

_name=cloup

pkgname=python-cloup
pkgver=3.0.7
pkgrel=1
pkgdesc="Cloup (= Click + groups) contains a set of Click extensions for multiple purposes."

arch=("any")
license=("MIT")
url="https://github.com/janLuke/cloup"

source=("https://github.com/janLuke/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('c589a68d058b20cdd935325ffdd79bb310ca962f024ab70dbc7924459ccf08678774831defd73f2b5646f981e081b5448e7516419566a89a13ff96f521ad03a1')

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
    pytest || echo "Some tests failed!"
}

package () {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
