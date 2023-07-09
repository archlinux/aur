# Maintainer: Ernesto Castellotti <erny.castell@gmail.com>

pkgname=blivet-gui-git
pkgver=2.4.1.r20.gd3c6d02
pkgrel=1
pkgdesc='GUI tool for storage configuration'
arch=('any')
license=('GPL')
url='https://github.com/storaged-project/blivet-gui'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=('git' 'python')
depends=('python' 'python-blivet-git' 'python-cairo' 'python-gobject' 'python-meh-git' 'python-pid')
source=("${pkgname%-git}::git+https://github.com/storaged-project/blivet-gui.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
	cd "${pkgname%-git}"
	make -k check
}

package() {
	cd "${srcdir}/${pkgname%-git}/"
	python setup.py install --root="${pkgdir}" --optimize=1
	install -D -m0644 blivet-gui.desktop "${pkgdir}/usr/share/applications/blivet-gui.desktop"
	install -D -m0644 org.fedoraproject.pkexec.blivet-gui.policy "${pkgdir}/usr/share/polkit-1/actions/org.fedoraproject.pkexec.blivet-gui.policy"
}
sha256sums=('SKIP')
