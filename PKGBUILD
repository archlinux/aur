# Maintainer: Kamil Krzyżanowski <kamnxt@kamnxt.com>
_pkgname=fusionclient
_reponame=FusionClient
pkgname=${_pkgname}-git
pkgver=20151023.d5f67ad
pkgrel=2
pkgdesc="Project Fusion is a cross-platform, open source multi-functional game launcher."
arch=('i386' 'x86_64')
url="https://github.com/FusionLauncher/FusionClient"
license=('GPL2')
depends=('libfusion-git')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!emptydirs)
source=("${_pkgname}::git+https://github.com/FusionLauncher/FusionClient")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
  cd "${srcdir}/${_pkgname}"
  qmake PREFIX=/usr
  make
}
package() {
  cd "${srcdir}/${_pkgname}"
  make INSTALL_ROOT="$pkgdir/" install
  install -Dm 644 -p dbUpdate "$pkgdir/usr/share/Fusion/dbUpdate"
  ln -s "$pkgdir/usr/bin/FusionClient" "$pkgdir/usr/bin/fusionclient"
}

# vim:set ts=2 sw=2 et:
