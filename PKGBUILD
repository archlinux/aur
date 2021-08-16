# Maintainer: Tim Paik <timpaik@163.com>
_pkgname=nvs
pkgname=nvs-git
pkgver=v1.6.0.r15.g024dea3
pkgver() {
	cd ${_pkgname}
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
_nodever=12.22.2
pkgrel=1
pkgdesc="A cross-platform tool for switching between versions and forks of Node.js"
arch=('x86_64')
url="https://github.com/jasongin/nvs"
license=('MIT')
depends=('openssl' 'zlib')
makedepends=('git')
install=nvs.install
source=("nvs.sh"
	"${_pkgname}::git+https://github.com/jasongin/nvs.git")
sha256sums=('654b7b6da107f901f360465d2083845b7be3462f4a46b6f55f8eaa50c669abbc'
            'SKIP')
package() {
	install -D ${srcdir}/${_pkgname}.sh ${pkgdir}/etc/profile.d/${_pkgname}.sh
	install -D ${srcdir}/${_pkgname}/LICENSE.txt ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
	install -d ${pkgdir}/opt/${_pkgname}/
	cp -r ${srcdir}/${_pkgname}/* ${pkgdir}/opt/${_pkgname}/
}
