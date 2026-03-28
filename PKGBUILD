# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: tommis <tommi@saira.fi>

_pkgauthor=sireliah
_pkgname=dragit
pkgname=${_pkgname}-bin
pkgdesc="Application for intuitive file sharing between devices"

pkgver=1.0.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('linux_amd_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('GPL-3.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc' 'glib2' 'gtk3' 'hicolor-icon-theme')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "${_pkgname}-${pkgver}.desktop::${_urlraw}/dragit.desktop"
        "${_pkgname}-${pkgver}.png::${_urlraw}/static/logo_icon_t_256x256.png")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${_pkgvername}_${_barch[0]}.tar.gz")
sha256sums=('8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903'
            '71d300ba9425f6cbdf2beefc7c796280a8105752bc1488ed121c17d895536960'
            '01ed564ca39b2b65ce117e627c27d9d45cf2a8349a5b032513e08a2b1349cfc2')
sha256sums_x86_64=('c934caccbe7909e6b3d480a437b55269cf23c2bdd69bd69322a3d1c1a5d0343e')


prepare() {
	cd "${srcdir}/" || exit

	sed -i "s/Icon=.*/Icon=${_pkgname}/g" ${_pkgname}-${pkgver}.desktop
}

package() {
	cd "${srcdir}/" || exit

    install -Dm755 "${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "${_pkgname}-${pkgver}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	install -Dm644 "${_pkgname}-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"

	install -Dm644 "${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
