# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>
# Contributor: Sean Bolton <sean at smbolton dot com>

pkgname=whysynth-git
_pkgname=whysynth
pkgver=20161216.563e494
pkgrel=2
pkgdesc="A versatile softsynth plugin for the DSSI Soft Synth Interface"
url="http://www.smbolton.com/whysynth.html"
depends=('alsa-lib' 'liblo' 'gtk2' 'fftw')
makedepends=('dssi' 'ladspa' 'git')
license=('GPL')
source=("git://github.com/smbolton/whysynth.git")
md5sums=('SKIP')
arch=('i686' 'x86_64')
conflicts=('whysynth')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
	cd "${srcdir}/${_pkgname}"
	./autogen.sh
	./configure --prefix=/usr || return 1
	make || return 1
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR=${pkgdir} install || return 1
	find ${pkgdir}/usr/lib -name '*.la' -exec rm {} \; || return 1
}

