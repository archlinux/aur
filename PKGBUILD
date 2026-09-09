# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=abogoyavlensky
_gitname=lgx
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A project and dependency manager for let-go. Fetch dependencies, run, build and test your app."

pkgver=0.2.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('let-go')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums=('700f8e15594b046b837cc12bdac0c302ebabff070385f1a7b3b1f8de480d12b2'
            '26ef0a9d298ba973d0b9bd3956e1f76e9d3c520f442e95917212e44905b1df94')
sha256sums_x86_64=('5d184b65ea366bc325ccf47c8a643d79024fb76d4198abc0e35c4dd3f2a4c182')
sha256sums_aarch64=('3ecf72eb0c68ad5ca645df4cd478ac72582df43b9ffcc61a42be7f0c2439ae92')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
