# Maintainer: Groctel <aur@taxorubio.com>
# Maintainer: Naveen M K <naveen521kk@gmail.com>
# shellcheck disable=SC2034,SC2154,SC2164

pkgbase=manimce
pkgname=manim
pkgver=0.18.1
pkgrel=1
pkgdesc="Animation engine for explanatory math videos (community edition)."

arch=("any")
license=("MIT" "custom")
url="https://github.com/ManimCommunity/manim"

source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('e227086c128603301a9ca78b9057a5a81489330ad204057982ef2cb38c6774b9e8d09d6cbb79457d80eb6f8ac761a6f27765df2e0d7d73461d29a17eb65296b9')

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
    "python-typing_extensions"
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
    "python-dearpygui: Graphical frontend"
    "jupyterlab: Jupyter integration"
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
