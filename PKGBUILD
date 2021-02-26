# Maintainer: Nícolas F. R. A. Prado <nfraprado at protonmail dot com>
pkgname=pcmn-git
pkgver=v1.0.0.r0.1a525de0c29e
pkgrel=1
pkgdesc="Simple declarative package management for Arch Linux"
arch=('any')
url="https://gitlab.com/nfraprado/pcmn"
license=('GPL3')
depends=('pacman' 'python' 'yay')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('pcmn::git+https://gitlab.com/nfraprado/pcmn.git#branch=master')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 pcmn.py "${pkgdir}/usr/bin/${pkgname%-git}"
	install -Dm755 config.json "${pkgdir}/usr/share/${pkgname%-git}/config.json"
	install -Dm755 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
	install -Dm755 README.rst "${pkgdir}/usr/share/doc/${pkgname%-git}/README.rst"
}
