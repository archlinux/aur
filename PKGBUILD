# Maintainer: Tom Willemse <tom@ryuslash.org>

_python=python
_name=wdocker

pkgname=$_python-wdocker-git
pkgver=32
pkgrel=2
pkgdesc='Define docker commands in your Dockerfile'
depends=('python')
makedepends=('git')
optdepends=('python-ansicolors: colored output')
arch=('any')
source=("git://github.com/babab/${_name}.git")
url='http://pypi.python.org/pypi/wdocker'
license=('custom:ISC')
conflicts=(python-wdocker)
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_name}"
    git rev-list --count HEAD
}

build() {
    cd "${srcdir}/${_name}"
    $_python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_name}"
    $_python setup.py install --root="$pkgdir"

    install -Dm644 "${srcdir}/${_name}/LICENSE" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${_name}/README.rst" \
            "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
    install -Dm644 "${srcdir}/${_name}/zsh/_wdocker" \
            "${pkgdir}/usr/share/zsh/site-functions/_wdocker"
}
