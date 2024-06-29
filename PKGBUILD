# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname=ttf-juisee
pkgver=0.1.1
pkgrel=1
pkgdesc='A font family for programming synthesized JuliaMono and LINE Seed JP'
arch=('any')
url='https://github.com/yuru7/juisee'
license=('custom:OFL')
provides=('ttf-font')
makedepends=('fontforge' 'python-fonttools' 'python-ttfautohint-py' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/yuru7/juisee/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ef55bfa8af01819336e1ee90ca08332c711d9abe46e9a56ab46fb9352bef9589')

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
