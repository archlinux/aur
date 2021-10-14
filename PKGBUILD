# Maintainer: Nguyễn Chính Hữu <huupoke12@gmail.com>
# Contributor: emersion <contact@emersion.fr>
# Contributor: ValdikSS <iam@valdikss.org.ru>

pkgname='osu'
pkgver='20211014'
pkgrel=1
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
sha256sums=('e3f76af05c5937a0f55110ddff85bdabb813187dbecdaec03b838f9b2eae6ee0'
            'b843e4c7750cd324d8b52440dfead07b77b347ba1fada81c782ddc5fa8554cf3'
            '5765f6c08e946170806fa89de1a71351b4c48cd8cf61e1779f00ca71c4c7490f'
            '0a2bb920ba3e8ddc9aa6e1bb2321c748b6efb06189294ccdb59fb1977d7a39b5'
            '85a5f5468a22dad75b8e8cfad8bd0754ed5e4ece693a398de0b90ba1934ac4fe')

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
