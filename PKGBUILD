# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]

pkgname=disc-kuraudo-home
pkgver=0.1.0
pkgrel=2
pkgdesc="Disc Kuraudo - The Disc Cloud"
arch=('x86_64')
license=('custom')
url='https://disc-kuraudo.eu'
depends=(
	'barcode'
	'bash'
	'cdrtools'
	'cdrdao'
	'diffutils'
	'ddrescue'
	'imagemagick'
	'jq'
	'libudfread-dk'
)
provides=(
	'disc-kuraudo'
)
source=(
	'https://disc-kuraudo.eu/releases/disc-kuraudo-home-0.1.0.tar.xz'
	*.patch # Any (untracked) patches lying around
)
sha256sums=('c889c81acaf8be674dd15c5446593bd734984bdd3ff0eb2050de607c3793efdb')
# Add SKIP for patches, if any
if [ ${#source[@]} -ne ${#sha256sums[@]} ]; then
	for i in $(seq $((${#source[@]} - ${#sha256sums[@]}))); do
		sha256sums+=('SKIP')
	done
fi

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	# Apply patch files                                    
	for p in "${srcdir}/"*.patch; do
		patch -Np0 < "${p}"
	done
}

package() {
	cp -rp "${srcdir}/${pkgname}-${pkgver}/"* "${pkgdir}"
}
