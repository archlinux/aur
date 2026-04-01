# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=paulrobello
_pkgname=par-term
pkgname=${_pkgname}-bin
pkgdesc="Cross-platform GPU-accelerated terminal emulator with inline graphics support (Sixel, iTerm2, Kitty)"

pkgver=0.30.3
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc' 'glib2' 'gtk3' 'gdk-pixbuf2' 'openssl' 'alsa-lib')

source=("${_pkgname}.desktop"
		"ICON-${pkgver}.png::${_urlraw}/assets/icon.png"
		"README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}")
sha256sums=('42adb7bfc245f5365f0afb67730e67e6a74e9b2e976c86a3dfda4bd479962b95'
            '297de4c331d29fdf2de56264cefc498be9d7dcf9459b3b76f6794b60f3cb70f4'
            '4ddab03785761a59a1ec615ed3d0585358d841eca7eef5f9c21cb7966ccf9a2d'
            '1605cdfa94fa4cbe47338cf5d7db9769fe4e795992594667f27ec4fa31a0558a')
sha256sums_x86_64=('554eacf8b1369117a6ecc0c65efdbc548594e6ecf3ab9b0033bf5033b4b025e2')
sha256sums_aarch64=('03508b6b4741fa2e7e67abd3ea8d8786329ccbbbc9cf2a62c621a19fd9c2df11')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	install -Dm644 "ICON-${pkgver}.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
