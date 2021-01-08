# Maintainer: gardenapple <gardenapple@posteo.net>
# Contributor: katt <magunasu.b97@gmail.com>

pkgname=fahcontrol-gtk3-git
pkgver=r181.02fc18c
pkgrel=2
pkgdesc='Graphical monitor and control utility for the Folding@home client (python3/GTK3 fork)'
url='https://foldingathome.org'
arch=('any')
license=('GPL3')
depends=('python' 'python-gobject' 'python-six' 'gtk3')
makedepends=('python-setuptools' 'git')
optdepends=('fahviewer: 3D simulation viewer')
provides=('fahcontrol')
conflicts=('fahcontrol')
#changelog="src/${pkgname}/CHANGELOG.md"
source=("${pkgname}::git+https://github.com/cdberkstresser/fah-control.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"

	# Number of revisions since beginning of the history: 
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${pkgname}"
	python setup.py build
}

package() {
	cd "${pkgname}"

	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 FAHControl.desktop -t "${pkgdir}"/usr/share/applications
}
