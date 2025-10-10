# Maintainer: Ernesto Castellotti <erny.castell@gmail.com>
# Maintainer: Cleber Matheus <clebermatheus@outlook.com>

pkgname=blivet-gui-git
pkgver=2.6.0.r162.g75fd66e
pkgrel=2
pkgdesc='GUI tool for storage configuration'
arch=('any')
license=('GPL')
url='https://github.com/storaged-project/blivet-gui'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=('git' 'python' 'python-cairo' 'python-setuptools' 'python-gobject'
	'python-pid' 'python-blivet' 'python-sphinx' 'python-pocketlint')
depends=('python' 'python-blivet' 'python-cairo' 'python-gobject' 'python-pid'
	'python-polib' 'python-coverage' 'python-pycodestyle' 'python-pip')
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
