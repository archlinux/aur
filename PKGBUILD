# Maintainer: Nguyễn Chính Hữu <huupoke12@gmail.com>
# Contributor: emersion <contact@emersion.fr>
# Contributor: ValdikSS <iam@valdikss.org.ru>

pkgname='osu'
pkgver='20210316'
pkgrel=1
pkgdesc='A free-to-win rhythm game'
arch=('i686' 'x86_64')
url='https://osu.ppy.sh'
license=('custom')
depends=('wine' 'winetricks' 'lib32-gnutls' 'lib32-libxcomposite')
makedepends=('icoutils')
optdepends=('pipewire-pulse: low-latency audio backend')
source=("${pkgname}-installer.exe::https://m1.ppy.sh/r/osu!install.exe"
        "${pkgname}-terms.md::https://raw.githubusercontent.com/ppy/osu-wiki/master/wiki/Legal/Terms/en.md"
        "${pkgname}.sh"
        "${pkgname}.desktop"
        "${pkgname}.xml")
sha256sums=('4ed5eec1c47ab86c69a3f3478127922227d6a0af2aff9a6461c02c19240883fd'
            'SKIP'
            'f46d063e16da50175154bfd9c09c1c461bb41d17bc2b6544842cbbd247b517e7'
            '0a2bb920ba3e8ddc9aa6e1bb2321c748b6efb06189294ccdb59fb1977d7a39b5'
            '85a5f5468a22dad75b8e8cfad8bd0754ed5e4ece693a398de0b90ba1934ac4fe')

build() {
	wrestool -x -t 3 -n 4 -R -o 'osu-stable.png' "${pkgname}-installer.exe"
	wrestool -x -t 3 -n 15 -R -o 'osu-stable-beatmap.png' "${pkgname}-installer.exe"
}

package() {
	install -D -m 755 "${pkgname}.sh" "${pkgdir}/usr/bin/osu-stable"
	install -D -m 644 "${pkgname}-installer.exe" "${pkgdir}/usr/share/${pkgname}/osu-stable-installer.exe"
	install -D -m 644 "${pkgname}-terms.md" "${pkgdir}/usr/share/licenses/${pkgname}/osu-terms.md"
	install -D -m 644 "${pkgname}.xml" "${pkgdir}/usr/share/mime/packages/osu-stable.xml"
	install -D -m 644 "${pkgname}.xml" "${pkgdir}/usr/share/applications/sh.ppy.osu.stable.desktop"
	install -D -m 644 'osu-stable.png' "${pkgdir}/usr/share/icons/hicolor/256x256/apps/osu-stable.png"
	install -D -m 644 'osu-stable-beatmap.png' "${pkgdir}/usr/share/icons/hicolor/256x256/mimetypes/osu-stable-beatmap.png"
}
