# Maintainer: theguy147 <yakamoz147 (at) protonmail (dot) com>

pkgname=apkleaks-git
pkgver=v1.0.2.r103.g401e09c
pkgrel=1
pkgdesc="scanning apk file for URIs, endpoints & secrets. (git version)"
url="https://github.com/dwisiswant0/apkleaks"
depends=('python' 'python-pyaxmlparser')
makedepends=('python-setuptools')
license=('Apache2')
conflicts=('apkleaks')
arch=('any')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${pkgname}"
    python setup.py build
}

package() {
    cd "${pkgname}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
