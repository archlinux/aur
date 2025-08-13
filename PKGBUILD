# Maintainer: Damglador <vse.stopchanskyi@gmail.com>

_pkgname=steam-update-inhibit-sleep
pkgname=$_pkgname-git
pkgver=r16.3dab6bc
pkgrel=1
pkgdesc="Don't worry about system suspending when Steam installs stuff"
arch=('any')
url="https://github.com/Damglador/steam-update-inhibit-sleep.git"
depends=(python-dbus python-vdf python-inotify-simple)
makedepends=(git python-build python-installer)
provides=("$_pkgname")
conflicts=("$_pkgname")
license=(GPL-3.0-only)
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $_pkgname
    python -m build
}

package() {
    cd $_pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
}
