# Maintainer: Lumaku <lumaku@mailbox.org>
pkgname=python-speechbrain-git
pkgver=0.5.5.r4420
pkgrel=1
pkgdesc='All-in-one speech toolkit in pure Python and Pytorch'
arch=('any')
url='https://github.com/speechbrain/speechbrain'
license=('Apache 2.0')
depends=('python>=3.7' 'python-hyperpyyaml-git' 'python-joblib' 'python-numpy' 'python-packaging' 'python-scipy' 'python-sentencepiece' 'python-pytorch' 'python-torchaudio' 'python-tqdm' 'python-huggingface-hub-git')
makedepends=('git' 'python-setuptools')
provides=('python-speechbrain-zoo')
conflicts=("python-speechbrain-zoo" "${pkgname}")
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

