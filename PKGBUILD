# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-enum-tools
_name=${pkgname#python-}
pkgver=0.13.0
pkgrel=2
pkgdesc="Tools to expand Python's enum module"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/domdfcoding/enum_tools"
depends=(
    python
    python-docutils
    python-pygments
    python-sphinx
    python-sphinx-jinja2-compat
    python-sphinx-toolbox
    python-typing_extensions
)
makedepends=(
    'git'
    'python-license-expression'
    'python-whey'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
license=('LGPL-3.0-or-later')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('84b2240d0953b4924523950a45983cb33569b6f9807fe6b43dc1798c0fc94d58')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
}

build() {
    cd "${srcdir}/${_name}"
    python -m whey --wheel 
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
