# Maintainer: Oleksandr Bilko <aur at bil dot com dot ua>
pkgname=meowsql
pkgver=0.4.11
_pkgver="v${pkgver}-alpha"
pkgrel=1
pkgdesc="An attempt to port a very useful GUI database client HeidiSQL to C++/Qt"
arch=('x86_64')
url="https://github.com/ragnar-lodbrok/meow-sql"
license=('GPL')
depends=(qt5-base mariadb-libs postgresql-libs)
makedepends=('git')
optdepends=('mariadb' 'postgresql')
conflicts=("meowsql-git")
source=("${pkgname}-${pkgver}-${pkgrel}::git+${url}.git#tag=${_pkgver}")
sha256sums=('SKIP')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}-${pkgrel}"
	qmake-qt5 meow-sql.pro
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}-${pkgrel}"
	install -D -m755 meow-sql ${pkgdir}/usr/bin/meowsql
	install -D -m644 meowsql.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/meowsql.svg
	install -D -m644 meowsql.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps/meowsql.png
	install -D -m644 meowsql.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
	install -D -m644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
	install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

