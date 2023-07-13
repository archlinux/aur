# Maintainer: anagram3k <luis.henriques at gmail>
# Contributor: coldBug <coldBug at e.mail dot de>

pkgname=folder-color-nautilus-git
pkgver=r42.61382f2
pkgrel=1
pkgdesc="Folder color switcher for nautilus with gnome icon- numix, vibrancy or humanity skin."
arch=(any)
url="http://foldercolor.tuxfamily.org/"
license=(GPL3)
depends=('python-nautilus' 'nautilus')
makedepends=('git' 'python-distutils-extra' 'python-setuptools')
optdepends=(
	'numix-icon-theme-git: to use with numix theme'
	'humanity-icon-theme: to use with humanity theme'
	'vibrancy-colors: to use with vibrancy theme'
)
source=($pkgname::git+https://github.com/costales/folder-color.git)
sha256sums=('SKIP')

conflicts=('folder-color-nautilus-bzr')
provides=('folder-color-nautilus-bzr')

install='folder-color-nautilus-git.install'

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$pkgname"

	sed -i 's/folder_i18n/folder-color/' ./po/POTFILES.in
	sed -i 's/folder_path/nautilus-extension/' ./po/POTFILES.in
	sed -i 's/folder_i18n/folder-color/' ./nautilus-extension/folder-color.py
}

package() {
	cd "$pkgname"
	python setup.py install --root="$pkgdir"
}

