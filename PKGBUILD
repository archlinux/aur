# Maintainer: Tomasz Pakuła <forest10pl@gmail.com>
_reponame=boxflat
pkgname=$_reponame-git
provides=($_reponame)
pkgver=1.0.0.0
pkgrel=1
pkgdesc="Adjust your Moza Racing gear settings"
arch=('x86_64')
url="https://github.com/Lawstorant/$_reponame"
license=('GPL3')
depends=(
	python
	python-yaml
	python-pyserial
	python-gobject
	python-cairo
	python-evdev
	python-psutil
	gtk4
	libadwaita
	udev
)
makedepends=(
  git
)
source=(
  git+https://github.com/Lawstorant/$_reponame
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_reponame"
  git describe --long --tags | cut -c2- | cut -d "-" -f 1-2 | tr "-" "."
}

package() {
  cd "$srcdir/$_reponame" || exit 1
  ./install.sh add-prefix "${pkgdir}" no-udev
}

post_install() {
	udevadm control --reload
	udevadm trigger --attr-match=subsystem=tty
}
