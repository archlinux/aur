# Maintainer: Kristóf Marussy <kristof@marussy.com>
# Contributor: Byeonghoon Yoo <bh322yoo@gmail.com>

_pkgname=cleo
pkgname=python-cleo-git
pkgver=1.0.0a5.r7.g9e8ecbe
pkgrel=2
pkgdesc="Cleo allows you to create beautiful and testable command-line interfaces."
arch=('any')
provides=("python-cleo")
conflicts=('python-cleo')
url="https://github.com/sdispater/${_pkgname}"
license=('MIT')
depends=('python-pylev>=1.3' 'python-pylev<2.0' 'python-crashtest>=0.3.1' 'python-crashtest<0.4.0' 'python>=3.7' 'python<4.0')
makedepends=('git' 'python-pyproject2setuppy')
checkdepends=('python-pytest' 'python-pytest-mock')
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}"/${_pkgname}
    python -m pyproject2setuppy build
}

check() {
    cd "${srcdir}"/${_pkgname}
    python -m pytest
}

package() {
    cd "${srcdir}"/${_pkgname}
    python -m pyproject2setuppy install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

