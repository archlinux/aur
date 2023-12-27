# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Tang Ziya <tcztzy@gmail.com>

_name=manim
pkgname=python-${_name}gl
pkgver=1.6.1
pkgrel=4
pkgdesc="Animation engine for explanatory math videos"
arch=(any)
url="https://github.com/3b1b/manim"
license=('MIT')
depends=(
    'ffmpeg'
    'texlive-core'
    'python'
    'python-colour'
    'python-numpy<1.25'
    'python-pillow'
    'python-scipy'
    'python-sympy'
    'python-tqdm'
    'python-matplotlib'
    'python-pygments'
    'python-pyyaml'
    'python-rich'
    'python-validators'
    'ipython'
    'python-opengl'
    # AUR packages
    'python-mapbox-earcut'
    'python-moderngl'
    'python-moderngl-window'
    'python-skia-pathops'
    'python-pydub'
    'python-screeninfo'
    'python-manimpango'
    'python-isosurfaces'
    'python-svgelements'
)
makedepends=(python-build python-installer python-wheel)
source=("$url/archive//v$pkgver.tar.gz")
b2sums=('70c0d4b893e1b15b536fd98e0584d2e5676802e2165407ed0cd62878120ce7f3ff43bf7eec8e16c12c95494322118215689f4138ff9dc190c86be206aa57124c')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
