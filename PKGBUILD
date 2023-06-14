# Maintainer: taotieren <cadmin@taotieren.com>

pkgname=python-pycorrector-git
pkgver=0.4.8.r12.g9069caa
pkgrel=1
pkgdesc='pycorrector is a toolkit for text error correction. 文本纠错，Kenlm，ConvSeq2Seq，BERT，MacBERT，ELECTRA，ERNIE，Transformer，T5等模型实现，开箱即用。 '
url='https://github.com/shibing624/pycorrector'
license=('Apache-2.0')
arch=(any)
_pydeps=(jieba
        numpy
        six
        loguru)
depends=(python
        pypinyin
#         kenlm
         "${_pydeps[@]/#/python-}")
checkdepends=(python-pytest)
makedepends=(git
            python-{build,installer}
             python-setuptools
             python-wheel)
optdepends=('kenlm: Faster and Smaller Language Model Queries')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    python -m build -wn
}

# check() {
#     cd "$pkgname"
#     PYTHONPATH=lib pytest tests
# }

package() {
    cd "$pkgname"
    python -m installer -d "$pkgdir" dist/*.whl
}

