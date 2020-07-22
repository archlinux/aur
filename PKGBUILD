# Maintainer: Tang Ziya <tcztzy@gmail.com>

pkgname=python-manimlib
_name=${pkgname#python-}
pkgver=0.1.11
pkgrel=1
pkgdesc="An animation engine for explanatory math videos"
arch=('any')
url="https://github.com/3b1b/manim"
license=('MIT' 'custom')
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
makedepends=('python-setuptools' 'python-pbr')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a211c55056b82651b1a92e4572661521312037e85aa6d086da70f346eeaf56f9')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}