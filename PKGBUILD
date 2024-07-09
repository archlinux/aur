# Maintainer: Tomasz Pakuła <forest10pl@gmail.com>
_reponame=boxflat
pkgname=boxflat-git
pkgver=0.0.1
pkgrel=4
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
  mkdir -p "${pkgdir}/usr/share/boxflat"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/bin"
  
  cp -r "$srcdir/$_reponame"/* "${pkgdir}/usr/share/boxflat/"
  cp "$srcdir/$_reponame/boxflat.desktop" "${pkgdir}/usr/share/applications/"
  install -D "$srcdir/$_reponame/boxflat.sh" "${pkgdir}/usr/bin/boxflat"
}
