# Contributor: American_Jesus <american.jesus.pt AT gmail DOT com>
# Maintainer: Matthew Sexton <wsdmatty@gmail.com>
pkgname=nano-syntax-highlighting-git
pkgver=2022.11.02.r2.ga9c6844
pkgrel=1
pkgdesc="improved nano syntax highlighting files"
arch=('any')
depends=('nano')
makedepends=('git')
url="https://github.com/galenguyer/nano-syntax-highlighting"
license=('GPL3')
install=nano-syntax-highlighting.install
provides=('nano-syntax-highlighting')
conflicts=('nano-syntax-highlighting')
source=('nano-syntax-highlighting::git+https://github.com/galenguyer/nano-syntax-highlighting.git')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'

}

build() {
	# Generate nanorc.sample
	find "${srcdir}"/"${pkgname%-git}"/*.nanorc -type f | sed "s@${srcdir}\/${pkgname%-git}@include \/usr\/share\/${pkgname%-git}@" > "${srcdir}/nanorc.sample"
}

package() {
	mkdir -p "${pkgdir}/usr/share/${pkgname%-git}"
	
	find "${srcdir}"/"${pkgname%-git}"/ -name '*.nanorc' | xargs install -D -m644 -t "${pkgdir}/usr/share/${pkgname%-git}/"
	
	install -D -m644 "${srcdir}/nanorc.sample" "${pkgdir}/usr/share/${pkgname%-git}/nanorc.sample"

} 


