# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=slock-jacob-git
pkgver=1.4.r1.d8c2ac7
pkgrel=1
pkgdesc="This Jacob McDonnell's build of slock see the repo for more details"
arch=(x86_64 i686)
url="https://gitlab.com/Jacob_McDonnell/slock.git"
license=('MIT/X Consortium License')
depends=()
makedepends=(git make)
optdepends=()
provides=(slock)
conflicts=(slock)
source=("git+$url")
md5sums=('SKIP')

pkgver(){
	cd slock
	printf "1.4.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd slock
	mkdir -p ${pkgdir}/opt/${pkgname}
	cp -rf * ${pkgdir}/opt/${pkgname}
	./configure
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
