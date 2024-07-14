# Maintainer: Tomasz Pakuła <forest10pl@gmail.com>
_reponame=boxflat
pkgname=boxflat-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Adjust your Moza Racing gear settings"
arch=('x86_64')
url="https://github.com/Lawstorant/boxflat"
license=('GPL3')
depends=(
	python
	python-yaml
	python-pyserial
	python-gobject
	python-cairo
	gtk4
	libadwaita
	udev
)
makedepends=(
  git
)
source=(
  git+https://github.com/Lawstorant/boxflat
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_reponame"
  git describe --long --tags | cut -d "-" -f 1-2 | tr "-" "r"
}

package() {
  cd "$srcdir/$_reponame" || exit 1
  ./install.sh add-prefix "${pkgdir}" no-udev
}

post_install() {
	udevadm control --reload
	udevadm trigger --attr-match=subsystem=tty
}
