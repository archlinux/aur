# Contributor: Igor Novikov <sk1 dot project dot org at gmail dot com>
# Maintainer: Joermungand <joermungand at gmail dot com>

pkgname=uniconvertor2-git
pkgver=r523.973d5b6
pkgrel=1
epoch=1
pkgdesc="A universal vector graphics translator"
url="https://sk1project.net/"
arch=('i686' 'x86_64')
license=('AGPL3')
depends=('lcms2' 'cairo' 'libmagick' 'pango' 'python2-cairo' 
	 'python2-pillow' 'python2-reportlab' 'python2-pycups')
makedepends=('git' 'python2')
provides=('uniconvertor')
conflicts=('uniconvertor')
source=("${pkgname%-*}"::'git+https://github.com/sk1project/uniconvertor.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-*}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname%-*}"
  LANG=en_US.UTF-8 python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname%-*}"
  LANG=en_US.UTF-8 python2 setup.py install --root="$pkgdir"
}
