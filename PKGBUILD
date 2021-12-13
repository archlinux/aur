# Maintainer: darthdomo <levipinkard@gmail.com>
pkgname=python-pyufr-git
_pkgname=python-pyufr
_gitname=pyuFR
pkgver=r67.2df1e2d
pkgrel=3
pkgdesc="Python3 library to communicate with Digital Logic µFR-series NFC readers"
arch=('x86_64')
url="https://github.com/Giraut/pyuFR"
license=('GPL3')
depends=('python')
makedepends=('git')
provides=('python-pyufr')
conflicts=()
options=()
source=(git+https://github.com/Giraut/pyuFR.git)
md5sums=('SKIP')

pkgver() {
	cd "${_gitname}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir"/"$_gitname"
	mkdir -p "$pkgdir"/usr/lib/python3.10/site-packages

	mkdir -p "$pkgdir"/usr/share/licenses/${_pkgname}

	mkdir -p "$pkgdir"/usr/share/"$_pkgname"/examples
	install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

	install -Dm 755 pyufr.py "$pkgdir"/usr/lib/python3.10/site-packages

	install -Dm 755 examples/* "$pkgdir"/usr/share/"$_pkgname"/examples
}
