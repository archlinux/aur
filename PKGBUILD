# Maintainer: Manuel Hüsers <aur@huesers.de>

pkgname=clonezilla-unstable
_pkgname=clonezilla
pkgver=5.12.3
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
source=("https://gitlab.com/stevenshiau/clonezilla/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz"
	'usrbin.patch')
sha512sums=('b3cfe1cfb0bf44fccd963a94de0a3cc9bb553f920e6bc726bcdb3da896cd1dadd3b00618f9c51b8587fd7d1b08ecbcdad02050a25730a3acfd34b9036c4ba59c'
            '39e63eaa18ffaed7fe9a2dde449c8b57d4a3dc313024213881bd620d0011671bb7f8a0346df7c247c2da94f8d82afb669057cb05dd9cefffafb680826544d6ac')

prepare() {
	cd "${_pkgname}-v${pkgver}"

	patch -Np0 -i "${srcdir}/usrbin.patch"
}

package() {
	cd "${_pkgname}-v${pkgver}"

	make DESTDIR="${pkgdir}" install
}
