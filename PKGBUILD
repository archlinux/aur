# Maintainer: noblehelm <noblehelm at gmail dot com>

_pkgname="powerline-shell"
pkgname="powerline-shell-git"
pkgver=r335.800b9cd
pkgrel=1
arch=('any')
pkgdesc="A Powerline style prompt for your shell"
depends=('python' 'powerline-fonts')
license=('MIT')
makedepends=('git')
optdepends=('awesome-terminal-fonts')
source=("git+https://github.com/banga/powerline-shell")
md5sums=('SKIP')
install=${pkgname}.install

pkgver() {
  cd ${srcdir}/${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd ${srcdir}/${_pkgname}
	cp config.py.dist config.py
	./install.py
}

package() {
	install -Dm 755 ${srcdir}/${_pkgname}/powerline-shell.py ${pkgdir}/usr/share/${_pkgname}/powerline-shell.py
	install -Dm 644 ${srcdir}/${_pkgname}/powerline_shell_base.py ${pkgdir}/usr/share/${_pkgname}/powerline_shell_base.py
	install -Dm 644 ${srcdir}/${_pkgname}/config.py ${pkgdir}/usr/share/${_pkgname}/config.py
	install -Dm 644 ${srcdir}/${_pkgname}/README.md ${pkgdir}/usr/share/${_pkgname}/README.md

	cp -R --preserve=mode ${srcdir}/${_pkgname}/lib ${pkgdir}/usr/share/${_pkgname}
	cp -R --preserve=mode ${srcdir}/${_pkgname}/themes ${pkgdir}/usr/share/${_pkgname}
	cp -R --preserve=mode ${srcdir}/${_pkgname}/segments ${pkgdir}/usr/share/${_pkgname}
}
