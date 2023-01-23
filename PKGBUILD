# Maintainer: AtticFinder65536 <atticfinder -AT- rocklabs -DOT- xyz>

pkgname=('manga-ocr-git')
_gitname=('manga-ocr')
pkgver=0.1.8.r0.g250b89f
pkgrel=1
pkgdesc="Optical character recognition for Japanese text, trained to handle Japanese manga well"
url="https://github.com/kha-white/manga-ocr"
license=('Apache')
source=('git+https://github.com/kha-white/manga-ocr.git')
b2sums=('SKIP')
arch=('any')
depends=('python' 'python-fire' 'python-fugashi' 'python-jaconv' 'python-loguru' 'python-numpy' 'python-pillow' 'python-pyperclip' 'python-pytorch>=1.0' 'python-transformers>=4.12.5' 'python-unidic-lite')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest')
provides=('manga-ocr')
conflicts=('manga-ocr')

pkgver(){
        cd "${_gitname}"
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
        cd "${_gitname}"
        python setup.py build
}

check(){
        cd "${_gitname}"
        pytest
}

package(){
        cd "${_gitname}"
        python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
