# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='taskwarrior-indicator-hg'
pkgdesc='Panel indicator for TaskWarrior'
pkgver=r161.1cddada89482
pkgrel=1
url='http://umonkey.net/projects/task-indicator/index.en.html'
license='MIT'
arch='any'
depends=(
	'python2'
	'hicolor-icon-theme'
	'gtk-update-icon-cache'
	'python2-gobject2'
)
optdepends=(
	'libappindicator-gtk2: Application indicator support'
)
source=("${pkgname}::hg+https://bitbucket.org/umonkey/task-indicator"
	taskwarrior-indicator-misc-fixes.patch)
install="${pkgname}.install"
sha512sums=('SKIP'
            'a3da5fe39b8d45e52bd06ee42ced8a2e36ca6f7181c2a84073ac8008a786b412b4bc74c743459ff4edd9da21b53e7cb8ae240657b7b0e55c4744cc16ce1eb89a')

pkgver () {
	cd "${pkgname}"
	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare () {
	cd "${pkgname}"
	patch -p1 < "${srcdir}/taskwarrior-indicator-misc-fixes.patch"
}

package () {
	cd "${pkgname}"
	python2 setup.py install --root="${pkgdir}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
