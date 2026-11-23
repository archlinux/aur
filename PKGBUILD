# Maintainer: taotieren <admin@taotieren.com>
# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Denis Vadimov <me@bloody.pw>

pkgname=python-bpylist2
_name=${pkgname#python-}
pkgver=4.1.1
pkgrel=3
epoch=
pkgdesc="Parse and generate NSKeyedArchiver archives"
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
_pydeps=(
)
depends=('python'
    "${_pydeps[@]/#/python-}")
makedepends=(
	python-poetry
    python-build
    python-installer
    python-wheel
    python-setuptools
)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('0cc63284aee42f5c7e0ec87f8f59cdd35aaed05ad12d866b1868ea0c0caaafe1')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    # install -Dm0644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    # install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
