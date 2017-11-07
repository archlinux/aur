# Maintainer: Benoit Brummer <trougnouf at gmail dot com>
pkgname='mabe-git'
pkgver=r173.3ea8481
pkgrel=1
pkgdesc='Modular Agent Based Evolution Framework'
url='https://github.com/Hintzelab/MABE'
depends=()
makedepends=('python' 'git' 'gcc')
license=('GPL3')
arch=('i686' 'x86_64')
source=(git+"${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd MABE
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
build() {
	cd "${srcdir}/MABE"
	python "PythonTools/MBuild.py"
}


package() {
	mkdir -p "${pkgdir}/usr/bin"
	cp "${srcdir}/MABE/MABE" "${pkgdir}/usr/bin"
}
