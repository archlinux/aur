# Maintainer: Ariana Gregg <lovetocode999 at tilde dot team>
pkgname=python-makelove-git
_name="makelove"
pkgver=0.0.6.r35.gf192818
pkgrel=1
pkgdesc="A packaging tool for löve games"
arch=("x86_64")
url="https://github.com/pfirsich/makelove"
license=("GPL3")
makedepends=("python-setuptools")
depends=("python")
provides=("python-makelove")
conflicts=("python-makelove")
source=("git+https://github.com/pfirsich/makelove.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${_name}"

    _tag=$(git tag --sort=v:refname | tail -n1)
    printf '%s.r%s.g%s' "${_tag#v}" "$(git rev-list "$_tag"..HEAD --count)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${_name}"
    python setup.py build
}

package() {
    cd "$srcdir/${_name}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
