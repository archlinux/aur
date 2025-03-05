# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname=ttf-plemoljp
pkgver=2.0.0
pkgrel=1
pkgdesc='Plex Mono Language JP'
arch=('any')
url='https://github.com/yuru7/PlemolJP'
license=('custom:OFL')
provides=('ttf-font')
makedepends=('fontforge' 'python-fonttools' 'python-ttfautohint-py' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/yuru7/PlemolJP/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dc85c20ac6369e92ee529bae0915dcb1fab233eb06b37b6bfa6dc990a23b170e')

prepare() {
	cd "PlemolJP-${pkgver}"

	sed 's/ideographic_space.sfd/Ideographic_Space.sfd/' -i build.ini
}

build() {
	cd "PlemolJP-${pkgver}"

	for opts in '' '--console' '--35' '--35 --console'; do
		python ./fontforge_script.py --do-not-delete-build-dir $opts
		python ./fonttools_script.py
	done
}

package() {
	cd "PlemolJP-${pkgver}"
	find build -type f -name '*.ttf' -exec install -Dm644 {} -t "${pkgdir}/usr/share/fonts/PlemolJP" \;
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
