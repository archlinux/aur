# Maintainer: Groctel <aur@taxorubio.com>
# Maintainer: Naveen M K <naveen521kk@gmail.com>

pkgbase=manimce
pkgname=manim
pkgver=0.18.0
pkgrel=1
pkgdesc="Animation engine for explanatory math videos (community edition)."

arch=("any")
license=("MIT" "custom")
url="https://github.com/ManimCommunity/manim"

source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('d52a3c3f5780c41fe7164a5ae164d46e7b372c2616f72e04fdf0c79f66ccc791c9d82db79c8d8258159cdf8a6f701d9a61bf1c43f547fdbb8641e63235b36a78')

conflicts=("python-manimlib")

depends=(
    "ffmpeg"
    "python"
    "python-cairo"
    "python-click"
    "python-click-default-group"
    "python-colour"
    "python-decorator"
    "python-google-api-core"
    "python-importlib-metadata"
    "python-numpy"
    "python-pillow"
    "python-pygments"
    "python-requests"
    "python-rich"
    "python-scipy"
    "python-setuptools"
    "python-tqdm"
    "python-watchdog"
    "python-networkx"
    # Aur dependencies
    "python-cloup"
    "python-backports.cached_property"
    "python-glcontext"
    "python-isosurfaces"
    "python-manimpango"
    "python-mapbox-earcut"
    "python-moderngl"
    "python-moderngl-window"
    "python-pydub"
    "python-screeninfo"
    "python-skia-pathops"
    "python-srt"
    "python-svgelements"
)
makedepends=(
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
optdepends=(
    "jupyterlab: Jupyter something"
    "python-grpcio-tools: WebGL renderer"
    "texlive-core: LaTeX support"
)

build () {
    cd "$srcdir/$pkgname-$pkgver" || exit
    python -m build --wheel --no-isolation
}

package () {
    cd "$srcdir/$pkgname-$pkgver" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m644 LICENSE.community "$pkgdir/usr/share/licenses/$pkgname/LICENSE.community"
}
