# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=python-etcd-git
pkgver=r263.f9edc6f
pkgrel=1
pkgdesc="A python client for Etcd"
arch=("any")
url="https://github.com/jplana/python-etcd"
license=('MIT')
depends=("python" "python-dnspython3" "python-urllib3")
makedepends=("python-setuptools")
provides=("python-etcd")
conflicts=("python-etcd")
replaces=("python-etcd")
source=("python-etcd-git::git+https://github.com/jplana/python-etcd.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$pkgname"
    python setup.py build
}

package() {
    cd "$pkgname"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -d -m 755 ${pkgdir}/usr/share/licenses/${pkgname}
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ft=sh
