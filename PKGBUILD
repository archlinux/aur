# Maintainer: Manuel Hüsers <aur@huesers.de>

pkgname=clonezilla-unstable
_pkgname=clonezilla
pkgver=5.5.15
pkgrel=1
pkgdesc="ncurses partition and disk imaging/cloning program"
arch=('any')
url="https://clonezilla.org"
license=('GPL2')
depends=('drbl' 'partclone' 'ntfs-3g' 'partimage' 'pigz' 'sshfs' 'parted'
	'gptfdisk' 'dosfstools' 'gzip' 'bzip2' 'pbzip2' 'lbzip2' 'lrzip'
	'xz' 'pixz' 'lzop' 'ecryptfs-utils' 'screen' 'perl' 'cifs-utils')
backup=('etc/drbl/drbl-ocs.conf')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("https://free.nchc.org.tw/drbl-core/src/unstable/${_pkgname}-${pkgver}.tar.xz"
	'usrbin.patch')
sha512sums=('a7d3dc61d327dfcc492ebe0d6974a934a816b0cea4583eb5687fdd37f106d4cd4305a7073a300024b57d25abe41fc658024d8c631d36f1b4555a13491ae93e51'
            '39e63eaa18ffaed7fe9a2dde449c8b57d4a3dc313024213881bd620d0011671bb7f8a0346df7c247c2da94f8d82afb669057cb05dd9cefffafb680826544d6ac')

prepare() {
	cd "${_pkgname}-${pkgver}"

	patch -Np0 -i "${srcdir}/usrbin.patch"
}

package() {
	cd "${_pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install
}
