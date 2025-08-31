# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-pypinyin-dict
_name=${pkgname#python-}
pkgver=0.9.0
pkgrel=1
epoch=
pkgdesc="使用 pinyin-data 和 phrase-pinyin-data 中的拼音数据文件覆盖 pypinyin 中的自带拼音数据，实现只使用某个或某些拼音数据文件中的拼音数据的需求"
arch=('any')
url="https://pypi.org/project/${_name}"
_name=${_name//-/_}
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    # AUR
    python-pypinyin
)
makedepends=(
    python-build
    python-installer
    python-wheel
    python-setuptools
)
optdepends=()
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('8c491396baa1567311f2ec759cbc154638f3bcefdc711d34e53e373e3a429fa5')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
