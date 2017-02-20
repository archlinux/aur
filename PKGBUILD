# Maintainer: Nahim El Atmani <nahim+dev@naam.me>

pkgname=shup-git
pkgver=v0.1.0.rc0.g1b581aa
pkgrel=1
pkgdesc="File sharing (images, code snippets, movies...) made easy. GIT version"
arch=('any')
url="https://github.com/Naam/shup"
license=('GPL3')
makedepends=('git')
depends=(
	'python'
	'python-paramiko'
	'python-progressbar2'
)
provides=(${pkgname})
conflicts=(${pkgname})
source=(${pkgname}::git+https://github.com/Naam/shup.git)
sha256sums=('SKIP')


pkgver() {
	cd ${pkgname}
	git describe --long --tags | sed 's/\([^-]*-g\)/rc\1/;s/-/./g'
}


package() {
	cd ${pkgname}
	python setup.py install -O1 --root="${pkgdir}/" --prefix=/usr
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
	install -Dm 644 ${srcdir}/${pkgname}/shup/shup.cfg "${pkgdir}/etc/shup/shup.cfg"
}

# vim:set ts=2 sw=2:
