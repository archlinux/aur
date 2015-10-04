_pkgname=panel
pkgname=${_pkgname}-git
pkgver=20151004.r2.e94633d
pkgrel=1
pkgdesc="Lemonbar wrapper"
url="https://github.com/shyiko/commacd"
license=('GPL3')
arch=('any')
depends=('bash' 'lemonbar')
makedepends=('git')
source=("${_pkgname}::git+git://github.com/moonarch/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "%s.r%s.%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${_pkgname}"
	echo $(pwd)
    install -Dm755 panel  "$pkgdir/usr/bin/panel"
	install -Dm755 config/config		"$pkgdir/etc/panel/config"
    install -Dm755 config/initialiser 	"$pkgdir/etc/panel/initialiser"
    install -Dm755 config/posthandler  	"$pkgdir/etc/panel/posthandler"
	install -Dm755 config/prehandler	"$pkgdir/etc/panel/prehandler"
}

