# Maintainer: 3ED_0 <krzysztofas at protonmail>
# Contributor: coldBug <coldBug at e.mail dot de>

pkgname=folder-color-nautilus-git
pkgver=r11.e76d1d9
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
install=$pkgname.install
source=($pkgname::git+https://github.com/costales/folder-color.git)
sha256sums=('SKIP')

conflicts=('folder-color-nautilus-bzr')
provides=('folder-color-nautilus-bzr')


pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$pkgname/install_scripts"
	./nautilus.sh
}

package() {
	cd "$pkgname"
	python setup.py install --root="$pkgdir"
}

