# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
# Contributor: katt <magunasu.b97@gmail.com>

pkgname=fahcontrol-git
pkgver=r89.7016206
pkgrel=1
pkgdesc='Folding@home Client Advanced Control GUI (git)'
arch=(any)
url=https://foldingathome.org
license=(GPL)
depends=(python2 pygtk)
optdepends=('fahviewer: 3D simulation viewer')
makedepends=(git python2-setuptools)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+https://github.com/FoldingAtHome/fah-control.git
		FAHControl.desktop)
md5sums=('SKIP'
         '81c1953f5c7cfb981ba1b7bf6a046f88')

pkgver() {
	cd fah-control
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd fah-control
    python2 setup.py build
}

package() {
	cd fah-control
	python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 FAHControl.desktop -t "$pkgdir"/usr/share/applications
}
