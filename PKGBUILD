# Maintainer: clove3am (aka: Caltlgin) <clove.dev.mailbox.org>

_gitauthor=crazy-max
_gitname=undock
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc='Extract contents of a container image in a local folder'

pkgver=0.14.0
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
sha256sums_x86_64=('25d99376c951c849cbba65a27cc186c03ae1a2792284040018cbb786e359edf6')
sha256sums_aarch64=('84a2d6db94169c2d9e903ae4b31d7e554a26ae0626534cba8419a747f239ccf8')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" -t "${pkgdir}/usr/bin"

	install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 "CHANGELOG.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

