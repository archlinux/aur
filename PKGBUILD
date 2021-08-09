# Maintainer: Nguyễn Chính Hữu <huupoke12@gmail.com>
# Contributor: emersion <contact@emersion.fr>
# Contributor: ValdikSS <iam@valdikss.org.ru>

pkgname='osu'
pkgver='20210809.1'
pkgrel=2
pkgdesc='A free-to-win rhythm game'
_terms_commit='b9f12f580514eaf0da2ad7d5a07a8fa71d816e0b'
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
sha256sums=('0abf3f151a0fbfeabdb8bf9f04915e68cd2843544ecc72713ccebad604fe30a3'
            'b843e4c7750cd324d8b52440dfead07b77b347ba1fada81c782ddc5fa8554cf3'
            '5765f6c08e946170806fa89de1a71351b4c48cd8cf61e1779f00ca71c4c7490f'
            '926b567b0a280dc36dc27e6435fe03329a655255627d423b64bb641ff071fb2b'
            '875f836a6869dab61e59ae0f78212770c8b82f2d6739e34053520dcce278ee10')

build() {
	wrestool -x -t 3 -n 4 -R -o 'osu-stable.png' "${pkgname}-installer-${pkgver}.exe"
	wrestool -x -t 3 -n 15 -R -o 'osu-stable-beatmap.png' "${pkgname}-installer-${pkgver}.exe"
}

package() {
	install -D -m 755 "${pkgname}.sh" "${pkgdir}/usr/bin/osu-stable"
	install -D -m 644 "${pkgname}-installer-${pkgver}.exe" "${pkgdir}/usr/share/${pkgname}/osu-stable-installer.exe"
	install -D -m 644 "${pkgname}-terms-${_terms_commit}.md" "${pkgdir}/usr/share/licenses/${pkgname}/osu-terms.md"
	install -D -m 644 "${pkgname}.xml" "${pkgdir}/usr/share/mime/packages/osu-stable.xml"
	install -D -m 644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/sh.ppy.osu.stable.desktop"
	install -D -m 644 'osu-stable.png' "${pkgdir}/usr/share/icons/hicolor/256x256/apps/osu-stable.png"
	install -D -m 644 'osu-stable-beatmap.png' "${pkgdir}/usr/share/icons/hicolor/256x256/mimetypes/osu-stable-beatmap.png"
}
