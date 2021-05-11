# Maintainer: Lumaku <lumaku@mailbox.org>
pkgname=python-pysndfx-git
pkgver=0.3.7.r139
pkgrel=1
pkgdesc='Apply audio effects directly to audio files or NumPy ndarrays'
arch=('any')
url='https://github.com/carlthome/python-audio-effects'
license=('Apache 2.0')
depends=('python>=3.7' 'python-numpy' 'sox' 'python-soundfile' 'python-librosa')
makedepends=('git' 'python-setuptools')
provides=('python-pysndfx')
conflicts=("python-pysndfx" "${pkgname}")
source=(
    "${pkgname}::git+${url}")
md5sums=(
    'SKIP')


pkgver() {
    cd "${pkgname}"
    printf "%s.r%s" "$(python setup.py --version)" "$(git rev-list --count HEAD)"
}


build() {
    cd "${pkgname}"
    python setup.py build
}


package() {
    cd "${pkgname}"
    export PYTHONHASHSEED=0
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

