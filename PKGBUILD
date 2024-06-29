# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname=ttf-juisee
pkgver=0.0.6
pkgrel=1
pkgdesc='A font family for programming synthesized JuliaMono and LINE Seed JP'
arch=('any')
url='https://github.com/yuru7/juisee'
license=('custom:OFL')
provides=('ttf-font')
makedepends=('fontforge' 'python-fonttools' 'python-ttfautohint-py' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/yuru7/juisee/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e1941e95de42f1e08b71e9f8d3525e196fc1ba626dc2fb9a018e5213699f0e41')

build() {
	cd "juisee-${pkgver}"
	fontforge --lang=py -script fontforge_script.py --slashed-zero --invisible-zenkaku-space
	find build -type f -name '*.ttf' -exec python -m ttfautohint --dehint --no-info {} {} \;
	python ./fonttools_script.py
}

package() {
	cd "juisee-${pkgver}"
	find build -type f -name '*.ttf' -exec install -Dm644 {} -t "${pkgdir}/usr/share/fonts/juisee" \;
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
