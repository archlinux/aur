# Maintainer: Nicolò Santamaria <nicolo.santamaria at proton dot me>

pkgname=jet-edit
_pkgname=jet
pkgver=r15.125704c
pkgrel=7
pkgdesc="jet is a fast and intuitive regex find & replace cli"
arch=('any')
url="https://github.com/NicoNex/${_pkgname}"
license=('GPL3')
makedepends=('git' 'go' 'gzip')
source=("git+https://github.com/NicoNex/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $srcdir/$_pkgname
	go build -o $_pkgname
	gzip -c jet.1 > jet.1.gz
}

package() {
  cd $srcdir/$_pkgname
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 jet.1.gz "${pkgdir}/usr/share/man/man1/jet.1.gz"
  install -Dm755 $_pkgname "${pkgdir}/usr/bin/${_pkgname}"
}
