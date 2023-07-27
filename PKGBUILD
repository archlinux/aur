# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname=ttf-juisee
pkgver=0.0.4
pkgrel=1
pkgdesc='A font family for programming synthesized JuliaMono and LINE Seed JP'
arch=('any')
url='https://github.com/yuru7/juisee'
license=('custom:OFL')
provides=('ttf-font')
makedepends=('fontforge' 'python-fonttools' 'python-ttfautohint-py')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/yuru7/juisee/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7703026ddee154d41bb7ced5df69ace4da561aa330e5c6f128c40a8b15ecee32')

build() {
	cd "juisee-${pkgver}"
	fontforge --lang=py -script fontforge_script.py --slashed-zero --invisible-zenkaku-space
}

package() {
	cd "juisee-${pkgver}"
	find build -type f -name '*.ttf' -exec install -Dm644 {} -t "${pkgdir}/usr/share/fonts/juisee" \;
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
