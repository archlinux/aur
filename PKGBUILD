# Maintainer: Mirko Scholz <srtlg>
pkgname=cae-v-sim
pkgver=3.7.2
pkgrel=6
pkgdesc='V_Sim visualizes atomic structures such as crystals, grain boundaries and so on'
arch=('i686' 'x86_64')
url='http://inac.cea.fr/L_Sim/V_Sim/index.en.html'
depends=('gtk2' 'ftgl' 'libyaml')
license=('custom:CeCILL')
source=("http://inac.cea.fr/L_Sim/V_Sim/download/v_sim-${pkgver}.tar.bz2")
sha1sums=('d3e4023e387e3ff4d988dda0d7b7004ad1d34fcc')

build() {
	cd "${srcdir}/v_sim-${pkgver}"
	./configure \
		--prefix=/usr \
		--enable-gtk-doc=no --disable-introspection \
		--with-xsf --with-cube
	make
}

package() {
	cd "${srcdir}/v_sim-${pkgver}"
	make DESTDIR="${pkgdir}" install
	for i in usr/share/gtk-doc usr/share/gir-1.0 usr/lib/girepository-1.0 usr/lib/python
	do
		rm -rf "${pkgdir}/$i"
	done
	
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	for lang in en fr
	do
		ln -s /usr/share/doc/v_sim/licence.${lang}.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.$lang
	done
}
