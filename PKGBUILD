# Maintainer: Victor Dmitriyev <mrvvitek@gmail.com>
# Contributor: arthur33 <sohieradrien@gmail.com>
pkgname='smartdeblur-git'
pkgver=20130530.24f4ab5
pkgrel=1
pkgdesc='A smart deblur program made by Y. Vladimir'
arch=('i686' 'x86_64')
url='http://yuzhikov.com/articles/BlurredImagesRestoration1.htm'
license=('GPLv3')
depends=('qt4' 'fftw')
makedepends=('git')
provides=('smartdeblur')

source=("${pkgname}::git+https://github.com/Y-Vladimir/SmartDeblur.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
    git show --format='%cI' -q master | sed 's/T.*//g;s/-//g'
    echo .
    git rev-parse --short master
    ) | tr -d '\n'
}

build () {
	cd "${srcdir}/${pkgname}/src"
	qmake-qt4
	make
}
package() {
	cd "${srcdir}/${pkgname}/src"
	install -dm755 "${pkgdir}/usr/bin/"
	install -Dm755 SmartDeblur "${pkgdir}/usr/bin/"
}
