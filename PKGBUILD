# Maintainer: Tomasz Pakuła <forest10pl@gmail.com>
_reponame=boxflat
pkgname=boxflat-git
pkgver=0.0.1.r3.g36c07e7
pkgrel=1
pkgdesc="Adjust your Moza Racing gear settings"
arch=('x86_64')
url="https://github.com/Lawstorant/boxflat"
license=('GPL3')
depends=(
	python
	python-yaml
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
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
  
package() {
  mkdir -p "${pkgdir}/usr/share/boxflat"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/bin"
  
  cp -r "$srcdir/$_reponame"/* "${pkgdir}/usr/share/boxflat/"
  cp "$srcdir/$_reponame/boxflat.desktop" "${pkgdir}/usr/share/applications/"
  install -D "$srcdir/$_reponame/boxflat.sh" "${pkgdir}/usr/bin/boxflat"
}
