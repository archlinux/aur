# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=trapexit
_pkgname=mergerfs
pkgname=${_pkgname}-bin
pkgver=2.42.0
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
sha256sums=('5bf5ab72b9a8d4405b8e3c15aaea4e2eab39e18d105c15a1b24e6133f1b00892'
            '26de2f82a16dc31e33a99ba3d148d1f4f7ccc0e6faa5f1de7e79caac6ba6f9b5')
sha256sums_x86_64=('0cf8692e1687c8a1140c714966c6f5f4b498a1537f1a0bef5665082ecb35fc12')
sha256sums_i686=('d795e46659a50af628ff6c02ce233794cb62f03867f48b5beb1cc4a39fd97c3b')
sha256sums_aarch64=('da318afbf109f025a41e9be86de5ebbdfb879546abf4cb5176c8c15881b7cf05')


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
