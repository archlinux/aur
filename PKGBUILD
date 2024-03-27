# Maintainer: Ernesto Castellotti <erny.castell@gmail.com>
# Maintainer: Cleber Matheus <clebermatheus@outlook.com>

pkgname=blivet-gui-git
pkgver=2.5.0.r16.g1b7473d
pkgrel=1
pkgdesc='GUI tool for storage configuration'
arch=('any')
license=('GPL')
url='https://github.com/storaged-project/blivet-gui'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=('git' 'python' 'python-cairo')
depends=('python' 'python-blivet-git' 'python-cairo' 'python-gobject' 'python-meh'
'python-pid' 'python-polib' 'python-coverage' 'python-pycodestyle' 'python-pip')
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
