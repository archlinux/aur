# Maintainer: Groctel <aur@taxorubio.com>
# Maintainer: Naveen M K <naveen521kk@gmail.com>

_name=ManimPango

pkgname=python-manimpango
pkgver=0.5.0
pkgrel=2
pkgdesc="C binding for Pango using Cython used in Manim to render (non-LaTeX) text."

arch=("x86_64")
license=("MIT")
url="https://manimpango.manim.community"

source=("https://github.com/ManimCommunity/$_name/releases/download/v$pkgver/$_name-$pkgver.tar.gz")
sha512sums=('2eccc5977c7b2e5b04f045b9cc5f5b919809b316ecc29d9c7bea02e5b0aaa322c81985da05971a280d2fea34072da07c552c4ab13f234b64b05195fa2c64acdb')

depends=(
    "cairo"
    "fontconfig"
    "glib2"
    "harfbuzz"
    "pango"
    "python"
    "python-gobject"
)
makedepends=(
    "cython"
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)

prepare()
{
    cd "$_name-$pkgver" || exit
}

build ()
{
    cd "$srcdir/$_name-$pkgver" || exit
    python -m build --wheel --no-isolation
}

package ()
{
    cd "$srcdir/$_name-$pkgver" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_name/LICENSE"
}
