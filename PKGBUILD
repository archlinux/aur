# Maintainer: clove3am (aka: Caltlgin) <clove.dev.mailbox.org>

_gitauthor=crazy-max
_gitname=undock
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc='Extract contents of a container image in a local folder'

pkgver=0.14.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums=('b45d480250159a6baa4c71f9b54d708c02421a3ada71475ec4417b421fc574db'
            'fd1639a860063a0d9caff4ae03d967ad1852b634c89e26583ef48a64d8397b94')
sha256sums_x86_64=('a22f95237ac3cb91c929353801740e480cb36611c6a7cc557eaff68f02289259')
sha256sums_aarch64=('6c93d6fdf50beee0018870b3f8271b876a96e2fa1de76ad43644b9b20def2e8b')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" -t "${pkgdir}/usr/bin"

	install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 "CHANGELOG.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

