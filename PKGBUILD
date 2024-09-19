# Maintainer: Manuel Hüsers <aur@huesers.de>

pkgname=clonezilla-unstable
_pkgname=clonezilla
pkgver=5.6.19
pkgrel=1
pkgdesc="ncurses partition and disk imaging/cloning program"
arch=('any')
url="https://clonezilla.org"
license=('GPL-2.0-or-later')
depends=('drbl' 'partclone' 'ntfs-3g' 'partimage' 'pigz' 'sshfs' 'parted'
	'gptfdisk' 'dosfstools' 'gzip' 'bzip2' 'pbzip2' 'lbzip2' 'lrzip'
	'xz' 'pixz' 'lzop' 'ecryptfs-utils' 'screen' 'perl' 'cifs-utils')
backup=('etc/drbl/drbl-ocs.conf')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("https://free.nchc.org.tw/drbl-core/src/unstable/${_pkgname}-${pkgver}.tar.xz"
	'usrbin.patch')
sha512sums=('98b60f6d8ba9894e57b9e3e827c1d219a4a214b6105d2592a6f6767ce061627e0b0b6af75eaab022b1c98c7fb77df56d33bf952fd804fabee43ab570efd6d628'
            '39e63eaa18ffaed7fe9a2dde449c8b57d4a3dc313024213881bd620d0011671bb7f8a0346df7c247c2da94f8d82afb669057cb05dd9cefffafb680826544d6ac')

prepare() {
	cd "${_pkgname}-${pkgver}"

	patch -Np0 -i "${srcdir}/usrbin.patch"
}

package() {
	cd "${_pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install
}
