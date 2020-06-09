# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Zachary Ashen <zachary.h.a@gmail.com>
pkgname=keep-cli-git
pkgver=0.1.15
pkgrel=1
pkgdesc="Keep-cli is a cli Google Keep client. You can add, delete, and manage your Google Keep notes."
arch=(x86_64 i686)
url="https://github.com/zack-ashen/keep-cli"
license=('MIT')
depends=(python)
makedepends=(python-setuptools git)
provides=(keep-cli)
conflicts=(keep-cli)
source=(git+$url)
md5sums=('SKIP')

_pkgname=keep-cli

pkgver() {
    cd "${_pkgname}"
    printf "0.1.15.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}"
    python setup.py build
}

package() {
    cd "${_pkgname}"
	msg "Running setup.py"
  	python setup.py install --root=${pkgdir} --optimize=1 --skip-build
}
