# Maintainer: Diego Nieto Cid <dnietoc@gmail.com>

pkgbase="python-github3.py"
pkgname=("python-github3.py" "python2-github3.py")

_commit="e586949a4dbed22f169afaffe25cb07e5a60a606"
pkgver="2.0.0"
pkgrel=1

pkgdesc="A comprehensive wrapper around the GitHub API (v3)"
arch=("any")
url="https://github.com/sigmavirus24/github3.py"
license=("custom:Modified BSD")
makedepends=("python-setuptools" "python2-setuptools")
source=(github3::"git+https://github.com/sigmavirus24/github3.py.git#commit=${_commit}")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/github3"
    python setup.py build
    python2 setup.py build
}

check() {
## TODO This needs betamax, coverage and mock as makedepends
#    cd "${srcdir}/${_module}-${pkgver}"
#    python setup.py test
#    python2 setup.py test
    :
}

package_python-github3.py() {
    depends=("python" "python-requests" "python-uritemplate" "python-dateutil" "python-jwcrypto")

    cd "${srcdir}/github3"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}

package_python2-github3.py() {
    depends=("python2" "python2-requests" "python2-uritemplate" "python-dateutil" "python-jwcrypto")

    cd "${srcdir}/github3"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
