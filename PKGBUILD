# Contributor: Igor Novikov <sk1 dot project dot org at gmail dot com>
# Maintainer: Joermungand <joermungand at gmail dot com>

pkgname=uniconvertor2-git
pkgver=r3694.a598e935
pkgrel=1
pkgdesc="A universal vector graphics translator"
url="https://sk1project.net/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('lcms2' 'cairo' 'libmagick6' 'pango' 'python2-cairo' 
	 'python2-pillow' 'python2-reportlab' 'python2-pycups')
makedepends=('git' 'python2')
provides=('uniconvertor')
conflicts=('uniconvertor')
source=("${pkgname%-*}"::'git://github.com/sk1project/sk1-wx.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-*}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname%-*}"
  export PKG_CONFIG_PATH="/usr/lib/imagemagick6/pkgconfig"
  LANG=en_US.UTF-8 python2 setup-uc2.py build
}

package() {
  cd "${srcdir}/${pkgname%-*}"
  LANG=en_US.UTF-8 python2 setup-uc2.py install --root="$pkgdir"
}
