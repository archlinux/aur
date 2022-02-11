# Maintainer: András Wacha <awacha@gmail.com>
pkgname=atsas
pkgver=3.0.4
pkgrel_upstream=2
pkgrel=2
pkgdesc="A program suite for small-angle scattering data analysis from biological macromolecules"
arch=('x86_64')
url="https://www.embl-hamburg.de/biosaxs/software.html"
license=('custom')
options=('!strip')
depends=( 'libgfortran.so=5' )
install=install

# !!! You have to download the sources yourself from https://www.embl-hamburg.de/biosaxs/download.html
# !!! Use the Ubuntu-20.04 version!

source=("local://ATSAS-${pkgver}-${pkgrel_upstream}_amd64.tar.gz" 'license.md' 'atsas.sh' 'atsas.fish' 'atsas.csh')
sha512sums=('aa82405268efb3f948609d930aac8a43be9c138e25e892b672054cf7cf010be4ed3f10f158c4bc418084f690a261758d9aa32e395d72638d822533a348b430e7'
            '3f728fb538b236f0ddce8a7c86303d14c529da4f117eb5f4c87ef5f0fef52dea3ae7650fc439316c08628dc641893ab10f85890577fcb8e67b9398fdbbfa773f'
            'SKIP'
            'SKIP'
            'SKIP'
)


package() {
	cd ${srcdir}
#	set > environment.txt
	ATSAS_ROOT=/opt/ATSAS
	mkdir -p "${pkgdir}${ATSAS_ROOT}"
	ln -s ATSAS "${pkgdir}/opt/atsas"
	cd "${srcdir}/ATSAS-${pkgver}-${pkgrel_upstream}" 
	cp -R * "${pkgdir}${ATSAS_ROOT}/"
#	DEST_BIN_DIR="$ATSAS_ROOT/bin"
#	GCC7_LIBDIR=$(ls -d /usr/lib/gcc/${CHOST}/7.*)
#	echo "GCC7 libdir: ${GCC7_LIBDIR}"
#	mkdir -p "${pkgdir}${DEST_BIN_DIR}"
#	mkdir -p "${pkgdir}${ATSAS_ROOT}/libexec"
#	for f in ${pkgdir}${ATSAS_ROOT}/bin/*; do
#		mv $f ${pkgdir}${ATSAS_ROOT}/libexec
#		f=$(basename $f)
#		cat >${pkgdir}${DEST_BIN_DIR}/$f <<EOF
##!/bin/sh
#export ATSAS=${ATSAS_ROOT} 
#export LD_LIBRARY_PATH=${ATSAS_ROOT}/lib/atsas:${GCC7_LIBDIR}
#${ATSAS_ROOT}/libexec/$f \$*
#EOF
#		chmod +x ${pkgdir}${DEST_BIN_DIR}/$f
#	done
	cd ${srcdir}
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	cp "${srcdir}/license.md" "${pkgdir}/usr/share/licenses/${pkgname}"
	mkdir -p "${pkgdir}/etc/profile.d"
	cp "${srcdir}/atsas".{csh,sh} "${pkgdir}/etc/profile.d/"
	chmod +x "${pkgdir}/etc/profile.d/atsas."{csh,sh}
 	mv "${pkgdir}${ATSAS_ROOT}/share/applications" "${pkgdir}/usr/share"
 	mv "${pkgdir}${ATSAS_ROOT}/share/icons" "${pkgdir}/usr/share"
 	mv "${pkgdir}${ATSAS_ROOT}/share/mime" "${pkgdir}/usr/share"
	mkdir -p "${pkgdir}/etc/fish/conf.d"
	cp "${srcdir}/atsas.fish" "${pkgdir}/etc/fish/conf.d/atsas.fish"
}
