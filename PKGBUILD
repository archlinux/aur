# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=karimz1
_gitname=open-file-lock-handle
_appname='oflh'
pkgname=${_gitname}-bin
pkgdesc="A cross-platform terminal UI to find processes using files, directories, and open handles"

pkgver=0.0.8
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('1b7c795cff5421573cce9a9e7038c7fec5193a2867c5092e94b6c32b176c91e7'
            '79d2fcdb0c79c0bf33e1afd2151b0187115b190c78c806a6aaf99b507a73ab31')
sha256sums_x86_64=('b2f1eae2956df4bd9b4de2af7bcbf95dd556b68ac7b3691a627ff88ea13f2402')
sha256sums_aarch64=('e89063d4f927e41cdcb7943e11b09d7edf85735fb824a1e89970f4afccc9dd31')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
