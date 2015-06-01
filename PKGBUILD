# Maintainer: Leonard König <leonard.r.koenig AT googlemail.com>
pkgname=herder-cpusim-git
url="https://github.com/HERDER2014/CPUSim"
_gitname=CPUSim
pkgver=1.0.3.r2.g4bfc9b2
pkgrel=1
pkgdesc="Pseudo Assembly/CPU-Simulator for educational purposes - QT-Version"
arch=(x86_64) #TODO
url="https://github.com/HERDER2014/CPUSim"
license=('(L)GPL')
depends=('qt4pas') #TODO?
makedepends=('git' 'lazarus' 'qt4pas' 'lazarus-qt')
# lazarus-qt may not be needed

optdepends=(
	'qtcurve-qt4: Confirmed-working theme')
source=('CPUSim::git+https://github.com/HERDER2014/CPUSim#branch=master')
md5sums=("SKIP")

pkgver() {
	cd "${srcdir}/${_gitname}/src"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

#prepare() {
#}

build() {
	cd /home/$(whoami)
	if [  -d ".lazarus" ]; then
		msg "ABORTING: Directory ~/.lazarus does not exist. Please run lazarus at least once to create it"
		exit
	else
		cd "${srcdir}/${_gitname}/src"
		lazbuild --build-mode=release --widgetset=qt --build-all --recursive cpusim.lpi
	fi
}

package() {
	cd "${srcdir}/${_gitname}"
	install -D -m 755 bin/cpusim ${pkgdir}/usr/bin/cpusim
	install -d -m 755 ${pkgdir}/usr/share/cpusim/Examples
	install -D -m 644 Examples/* ${pkgdir}/usr/share/cpusim/Examples
	install -D -m 644 cpusim.desktop ${pkgdir}/usr/share/applications/cpusim.desktop
	install -D -m 644 src/cpusim.png ${pkgdir}/usr/share/pixmaps/cpusim.png
}
