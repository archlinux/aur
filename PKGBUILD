# Maintainer: Pieter Lenaerts <pieter dot aj dot lenaerts gmail>

pkgname=imgdupes-git
_pkgname=imgdupes
pkgver=1.2.r8.g8b19330
pkgrel=1
provides=('imgdupes')
conflicts=('imgdupes')
pkgdesc='Checks for duplicated images in a directory tree, ignoring metadata'
arch=('any')
url='https://github.com/jesjimher/imgdupes'
depends=('libgexiv2' 'python2-texttable' 'python2-jpegtran-cffi')
makedepends=('git')
license=('GPL3')
source=("git+https://github.com/jesjimher/imgdupes.git")
sha512sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	patch "${srcdir}/imgdupes/imgdupes.py" << EOF
1c1
< #!/usr/bin/python
---
> #!/usr/bin/python2
EOF
}

package() {
	install -Dm755 "${srcdir}/imgdupes/imgdupes.py" "${pkgdir}/usr/bin/imgdupes"
	install -Dm644 "${srcdir}/imgdupes/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
