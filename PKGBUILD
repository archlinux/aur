# Maintainer: Antti-Jussi Nieminen <ajnieminen@protonmail.com>
# Contributor: Artur Gurov <artgur90@gmail.com>
pkgname=tasksh
pkgver=1.2.0
pkgrel=2
pkgdesc='A shell command that wraps Taskwarrior commands'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://gothenburgbitfactory.org/projects/tasksh.html"
license=('MIT')
depends=('task')
makedepends=('cmake')
source=("https://github.com/GothenburgBitFactory/taskshell/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('0c0a678a1cf48d1b7fcc123da5152d74bbb4334520252788ad38e3cb9bd2a5189902c066d7dbc848a23f6c7c25e53a8e1dc240dd6e57dbbdc993079a3e9fc417')
build() {
	cd "${pkgname}-${pkgver}" || exit
	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make
}
package() {
	cd "${pkgname}-${pkgver}" || exit
	make DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
