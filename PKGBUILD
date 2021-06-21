# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=amb
pkgver=20201223
pkgrel=1
pkgdesc='AMB stands for Ancient Machines Book. It is an extremely lightweight file format meant to store any kind of hypertext documentation '
url='http://ambook.sourceforge.net/'
license=('MIT')
arch=('x86_64' 'aarch64')
conflicts=(${pkgname}-svn)
depends=('ncurses')
makedepends=('ncurses')
source=("http://amb.osdn.io/archiwum/${pkgname}-${pkgver}.tar.xz"
        "ptui-ncurses.c.patch")
sha512sums=('4d26bbca83836a890e593c0d95bd9dc92117e93be71b16ed5710dd89854753e772d930de590744b6b4960b2ceef47925a2361fe850ff48fd2bd741b07ea5e0a2'
            '3dc017d1e933939d5093b65fb0622ecee88b7e9071834229a60c5f277b1caa0b30dd3bd8c2d1106cb5c1af4e562617e55bca17feb3187b32baa4b382a2312b31')

prepare() {
  patch "${srcdir}/${pkgname}-${pkgver}/ptui/ptui-ncurses.c" < "${startdir}/ptui-ncurses.c.patch"
}

build() {
  patch "${srcdir}/${pkgname}-${pkgver}/ptui/ptui-ncurses.c" < "${startdir}/ptui-ncurses.c.patch"
	cd ${srcdir}"/"${pkgname}"-"${pkgver}
	make
}

prepare() {
	cd ${srcdir}"/"${pkgname}"-"${pkgver}
	sed -n '/.*LICENSE.*/,$p' ${pkgname}.txt > LICENSE
}

package() {
	mkdir -p "${pkgdir}/usr/bin/"
	cd ${srcdir}"/"${pkgname}"-"${pkgver}
	mv ${pkgname}	${pkgdir}/usr/bin/
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
