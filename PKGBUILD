# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: jfrankenau
pkgname=rover
pkgver=1.0.1
pkgrel=1
pkgdesc='Simple file browser for the terminal.'
arch=('i686' 'x86_64')
url='https://github.com/lecram/rover'
license=('custom:Public Domain')
depends=('ncurses')
source=("https://github.com/lecram/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('d40c684e0504d4a5f2525dd72df89d6bf1a209f8c83a6fc9eaca9f8b9613effa')

build() {
	cd "${pkgname}-${pkgver}"
	make
  sed -n '/All of the source code/,/warranty of any kind./p' README.md > LICENSE
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" PREFIX='/usr' MANPREFIX='/usr/share/man' install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
