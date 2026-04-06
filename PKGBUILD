# Maintainer: Andrej Radović <r.andrej@gmail.com>

pkgname=t3mujinpack-git
pkgver=nightly.r5.g0b421f3
pkgrel=1
pkgdesc="Darktable film-emulation styles from the t3mujinpack master branch"
arch=('any')
url='https://github.com/t3mujinpack/t3mujinpack'
license=('MIT')
depends=('darktable')
makedepends=('git')
provides=('t3mujinpack')
conflicts=('t3mujinpack')
source=("${pkgname}::git+https://github.com/t3mujinpack/t3mujinpack.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${srcdir}/${pkgname}"

	install -dm755 "${pkgdir}/usr/share/darktable/styles"
	install -m644 ./*.dtstyle "${pkgdir}/usr/share/darktable/styles/"
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
