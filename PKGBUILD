# Maintainer: taotieren <cadmin@taotieren.com>

pkgname=python-xmnlp-git
pkgver=0.5.3.r1.g57c72cc
pkgrel=1
pkgdesc='xmnlp：提供中文分词, 词性标注, 命名体识别，情感分析，文本纠错，文本转拼音，文本摘要，偏旁部首，句子表征及文本相似度计算等功能 '
url='https://github.com/SeanLee97/xmnlp'
license=('Apache-2.0')
arch=(any)
_pydeps=(tokenizers
        scikit-learn
        numpy
        )
depends=(python
         "${_pydeps[@]/#/python-}")
checkdepends=(python-pytest)
makedepends=(git
            python-{build,installer}
             python-setuptools
             python-wheel)
optdepends=('python-onnxruntime: Cross-platform, high performance scoring engine for ML models')
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

