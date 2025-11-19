# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=trapexit
_pkgname=mergerfs
pkgname=${_pkgname}-bin
pkgver=2.41.1
pkgrel=1
_pkgvername=${pkgver}
pkgdesc="Featureful union filesystem. Combines directories from various filesystems into a storage pool"
arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' 'i386' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('ISC')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
optdepends=('mergerfs-tools-git: manage data in a pool')

options=(!strip)

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-static-linux_${_barch[0]}.tar.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-static-linux_${_barch[1]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-static-linux_${_barch[2]}.tar.gz")
sha256sums=('b442f17731ef6c5638e49aeb8abb0add16d4f9f624105246812ef984d41c19f4'
            '26de2f82a16dc31e33a99ba3d148d1f4f7ccc0e6faa5f1de7e79caac6ba6f9b5')
sha256sums_x86_64=('56651d4bb0d8e672046cc00d396f766874b5478487f0b031fe04b9ec2f2de6ba')
sha256sums_i686=('cbe31cf6fd4ef61d85c9fd48966ee99f68b34bf432ceafdd970d35ee67125263')
sha256sums_aarch64=('e3fc92b53b6a28dbaa2b7320a1a608657cf6eb9aee1a506789a20c6bcbec44a4')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "./sbin/mount.mergerfs" -t "${pkgdir}/usr/bin/"

	install -Dm755 "./usr/local/bin/mergerfs" -t "${pkgdir}/usr/bin/"
	install -Dm755 "./usr/local/bin/fsck.mergerfs" -t "${pkgdir}/usr/bin/"
	install -Dm755 "./usr/local/bin/mergerfs-fusermount" -t "${pkgdir}/usr/bin/"
	install -Dm755 "./usr/local/bin/mergerfs.collect-info" -t "${pkgdir}/usr/bin/"

	install -Dm644 "./usr/local/lib/mergerfs/preload.so" -t "${pkgdir}/usr/lib/mergerfs/"

	install -Dm644 "./usr/local/share/man/man1/mergerfs.1" -t "${pkgdir}/usr/share/man/man1/"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
