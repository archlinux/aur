# Maintainer: fk29g <fk29g.uphill912@slmails.com>
_projectname=trre
pkgname=${_projectname}-git
pkgver=r72.c474a68
pkgrel=1
pkgdesc="Extension of regular expressions for text editing and a grep-like command line tool"
arch=("x86_64")
url="https://github.com/c0stya/trre"
license=("MIT")
makedepends=("git")
provides=("$_projectname")
conflicts=("$_projectname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_projectname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_projectname"
	make
}

check() {
    cd "$_projectname"
    chmod +x test.sh
    sh test.sh
}

package() {
	cd "$_projectname"
    install -Dm 755 $_projectname $pkgdir/usr/bin/$_projectname
    install -Dm 755 ${_projectname}_dft $pkgdir/usr/bin/${_projectname}_dft
    install -Dm 644 LICENSE $pkgdir/usr/share/licenses/${_projectname}/LICENSE
    install -Dm 644 $_projectname.1 $pkgdir/usr/share/man/man1/${_projectname}.1
    gzip $pkgdir/usr/share/man/man1/${_projectname}.1
}
