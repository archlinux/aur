# Maintainer: Tang Ziya <tcztzy@gmail.com>

pkgname=python-manimlib
_name=${pkgname#python-}
pkgver=0.1.10
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
sha256sums=('895818bdc078c92f6fe64cef0ccf6314fb4364bd205e7272fc055fcff358e96d')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}