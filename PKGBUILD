# Maintainer: Ewen Le Bihan <hey@ewen.works>
pkgname=ffcss
pkgver=0.2.0
pkgrel=1
pkgdesc="A CLI interface to apply and configure FirefoxCSS themes"
arch=('x86_64' 'i686')
url="https://github.com/ewen-lbh/ffcss"
license=("GPL-3.0")
provides=("${pkgname}")
makedepends=('git' 'go>=1.14' 'make')
conflicts=("${pkgname}-git" "${pkgname}-bin")
depends=('bash' 'firefox' 'git' 'wget')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	rm -f "${pkgdir}/usr/bin/${pkgname}"
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 ffcss "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	mkdir -p ~/.config/ffcss/themes
	cp themes/*.yaml ~/.config/ffcss/themes/
}

