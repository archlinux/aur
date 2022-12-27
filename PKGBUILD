# Maintainer: KUMAX <kumax2048@pm.me>

_name=ItChat-UOS
pkgname=python-itchat-uos-git
pkgrel=1
pkgver=r202.ff4ad96
pkgdesc="A complete and graceful API for Wechat."
url=https://pypi.org/project/itchat-uos
arch=("any")
license=("MIT")
provides=("python-itchat")
depends=('python-requests' 'python-pyqrcode' 'python-pypng')
source=('git+https://github.com/why2lyj/ItChat-UOS.git')
conflicts=("python-itchat" "python-itchat-git" "python-itchat-uos")
# https://github.com/why2lyj/ItChat-UOS/commit/2f141acc3e780fe516516ea74d82c0d5c8a9ffce.patch
sha256sums=('SKIP')
makedepends=('python-setuptools' 'git')

pkgver() {
    cd ${_name}
    ( set -o pipefail
            git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )	
}

build() {
	cd ${srcdir}/${_name}
	python setup.py clean --all
    python setup.py build
}

package() {
	cd ${srcdir}/${_name}
    python setup.py install --root="$pkgdir" --optimize=1
}
