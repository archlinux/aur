# Maintainer: coldBug <coldBug at e.mail dot de>

pkgname=folder-color-nautilus-bzr
pkgver=0.0.81
pkgrel=1
pkgdesc="Folder color switcher for nautilus with gnome icon- numix, vibrancy or humanity skin."
arch=(any)
url="http://foldercolor.tuxfamily.org/"
license=(GPL3)
depends=('python-nautilus' 'nautilus' 'gtk2')
makedepends=('bzr' 'python-distutils-extra' 'python-setuptools')
optdepends=('numix-icon-theme-git: to use with numix theme' 'humanity-icon-theme: to use with humanity theme' 'vibrancy-colors: to use with vibrancy theme')
install=$pkgname.install
source=($pkgname::bzr+http://bazaar.launchpad.net/~costales/folder-color/trunk)
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname/"
    echo $(egrep -m 1 -o "([0-9]{1,}\.)+[0-9]{1,}" setup.py)
}

prepare() {
    cd "$pkgname/install_scripts/"
    ./nautilus.sh
    cd ..
    chmod +x setup.py
}

package() {
    cd "$pkgname/"
    ./setup.py install --root="$pkgdir"
}

