# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

pkgname='osu'
pkgver='20220906'
pkgrel=1
pkgdesc='A free-to-win rhythm game'
_terms_commit='a5cf78c68e98280985f58725868b8df0cd2498b8'
arch=('i686' 'x86_64')
url='https://osu.ppy.sh'
license=('custom')
depends=('wine' 'winetricks' 'lib32-gnutls' 'lib32-libxcomposite' 'lib32-gst-plugins-base-libs')
makedepends=('icoutils')
optdepends=('pipewire-pulse: low-latency audio backend')
source=("${pkgname}-installer-${pkgver}.exe::https://m1.ppy.sh/r/osu!install.exe"
        "${pkgname}-terms-${_terms_commit}.md::https://raw.githubusercontent.com/ppy/osu-wiki/${_terms_commit}/wiki/Legal/Terms/en.md"
        "${pkgname}.sh"
        "${pkgname}.desktop"
        "${pkgname}.xml")
sha256sums=('03cc9840f68fcbba67c4e1528f77797d15dd97f777bb9478dd956d8522c7fa71'
            'd1768c68f6011c470c530db5d919f3643a161fce79b42bf6d8c6f6dab10253cc'
            'b689540a3f856e9429429e7477641e161ff75748eb4909a0a00b8cda5d34e76e'
            '3d98f5811539d652bf6378c2c76bff7b6d5ac82e6322942bb287ff9082f1715b'
            '030fb176a43f6cc3306c48123bbdeea6643ef4d0014f369b2bb16d5772feb076')

build() {
	wrestool -x -t 3 -n 4 -R -o 'osu-stable.png' "${pkgname}-installer-${pkgver}.exe"
	wrestool -x -t 3 -n 15 -R -o 'osu-importable.png' "${pkgname}-installer-${pkgver}.exe"
}

package() {
	install -D -m 755 "${pkgname}.sh" "${pkgdir}/usr/bin/osu-stable"
	install -D -m 644 "${pkgname}-installer-${pkgver}.exe" "${pkgdir}/usr/share/${pkgname}/osu-stable-installer.exe"
	install -D -m 644 "${pkgname}-terms-${_terms_commit}.md" "${pkgdir}/usr/share/licenses/${pkgname}/osu-terms.md"
	install -D -m 644 "${pkgname}.xml" "${pkgdir}/usr/share/mime/packages/osu-stable.xml"
	install -D -m 644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/sh.ppy.osu.stable.desktop"
	install -D -m 644 'osu-stable.png' "${pkgdir}/usr/share/icons/hicolor/256x256/apps/osu-stable.png"
	install -D -m 644 'osu-importable.png' "${pkgdir}/usr/share/icons/hicolor/256x256/mimetypes/application-x-osu-importable.png"
}
