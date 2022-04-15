# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Tang Ziya <tcztzy@gmail.com>

_name=manimgl
pkgname=python-$_name
pkgver=1.6.1
pkgrel=1
pkgdesc="Animation engine for explanatory math videos"
arch=(any)
url="https://github.com/3b1b/manim"
license=('MIT')
depends=(
    'python-argparse'
    'python-colour'
    'python-numpy'
    'python-pillow'
    'python-progressbar'
    'python-scipy'
    'python-tqdm'
    'opencv'
    'python-cairo'
    'cairo'
    'ffmpeg'
    'sox'
    # AUR package
    'python-pydub'
)
optdepends=('texlive-most: latex support')
makedepends=(python-build python-installer python-pbr python-wheel)
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('SKIP')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
