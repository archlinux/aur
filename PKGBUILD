# Maintainer: Vladimir Gorbunov <truedaemon@gmail.com>
pkgname=hy-git
_gitname=hy
pkgver=0.18.0.r16.g88f30c4b
pkgrel=1
pkgdesc="Python <--> Lisp layer"
arch=('any')
url="http://hylang.org/"
license=('MIT')
depends=('python-rply' 'python-astor' 'python-colorama' 'python-funcparserlib')
makedepends=('python-setuptools')
conflicts=('hy')
provides=('hy')
options=(!emptydirs)
source=("git://github.com/hylang/hy.git")
md5sums=("SKIP")

pkgver() {
    cd "${_gitname}"
    git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
    cd "${_gitname}"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -rf "$pkgdir/usr/get_version"
}
