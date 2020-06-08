# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=dwmblocks-jacob-git
pkgver=1.0.0.r1.d3c3476
pkgrel=1
pkgdesc="This Jacob McDonnell's build of dwmblocks see the repo for more details"
arch=(x86_64 i686)
url="https://gitlab.com/Jacob_McDonnell/dwmblocks.git"
license=('MIT/X Consortium License')
depends=(libxft-bgra)
makedepends=(git make)
optdepends=(dwmblocks)
provides=(dwmblocks)
conflicts=(dwmblocks)
source=("git+$url")
md5sums=('SKIP')

pkgver(){
	cd dwmblocks
	_pkgver=$(awk '/VERSION/ {print $3}' config.mk|head -1)
 	echo "${_pkgver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
	cd dwmblocks
	mkdir -p ${pkgdir}/opt/${pkgname}
	cp -rf * ${pkgdir}/opt/${pkgname}
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
