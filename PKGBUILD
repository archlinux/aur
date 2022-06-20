# Maintainer: beliys <aur at bil dot com dot ua>
pkgname=meowsql
pkgver=0.4.16
_pkgver="v${pkgver}-alpha"
pkgrel=1
pkgdesc="An attempt to port a very useful GUI database client HeidiSQL to C++/Qt (currently alpha)"
arch=('x86_64')
url="https://github.com/ragnar-lodbrok/meow-sql"
license=('GPL2')
depends=(qt5-base mariadb-libs postgresql-libs hicolor-icon-theme)
makedepends=('git')
optdepends=('mariadb' 'postgresql')
conflicts=("meowsql-git")
source=("${pkgname}-${pkgver}-${pkgrel}::git+${url}.git#tag=${_pkgver}")
sha256sums=('SKIP')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}-${pkgrel}"
	qmake-qt5 meowsql.pro
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}-${pkgrel}"
	install -D -m755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
	install -D -m644 ${pkgname}.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg
	install -D -m644 ${pkgname}.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png
	install -D -m644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
	install -D -m644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
	install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
