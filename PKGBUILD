# Maintainer: taotieren <admin@taotieren.com>

pkgname=aos-tools
_name=$pkgname
pkgver=1.1.43
pkgrel=1
epoch=
pkgdesc="aos-tools 是 AliOS Things 的命令行编译系统，支持组件管理、程序编译、烧录等功能。aos-tools 使用git 来获取组件的代码和维护代码的版本管理。"
arch=('any')
url="https://pypi.org/project/aos-tools/"
license=('BSD')
groups=()
_pydeps=(
    chardet
    configupdater
    gitdb
    glob2
    httplib2
    threadpoolctl
    smmap
    urllib3
    pyserial
    pyyaml)
depends=(
    bash
    git
    scons
    python
    "${_pydeps[@]/#/python-}")
makedepends=(
    python-{build,installer,setuptools,wheel})
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('c213b6613b2609727d786275fe5020567fb401e9fa17358a8656cad5a4d883ef')
#validpgpkeys=()

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
#     python setup.py build
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
#     python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
