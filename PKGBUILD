# Maintainer: Jakob (XDjackieXD) <aur at chaosfield dot at>

pkgname=rmview-git
_pkgname=rmview
pkgver=r101.e0a3e69
pkgrel=2
pkgdesc="a fast live viewer for reMarkable 1 and 2"
arch=('any')
url="https://github.com/bordaigorl/rmview"
license=('GPL3')
depends=('python' 'python-pyqt5' 'python-paramiko' 'python-twisted')
makedepends=( 'git' 'python-setuptools')
source=("${pkgname}"::'git+https://github.com/bordaigorl/rmview.git')
md5sums=('SKIP')

pkgver() {
  	cd "${srcdir}/${pkgname}"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
		|| printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "${srcdir}/${pkgname}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}"
	python3 setup.py install --root="$pkgdir/" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
