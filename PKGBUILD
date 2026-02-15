# Maintainer: Debucquoy Anthony (tonitch) <d.tonitch@gmail.com>

pkgname=linux-arctis-manager
_pkgname=Linux-Arctis-Manager
pkgver=2.0.1
pkgrel=1
pkgdesc="A replacement for SteelSeries GG software, to manage your Arctis device on Linux!"
arch=('x86_64')
url="https://github.com/elegos/Linux-Arctis-Manager"
license=('GPL-3.0-only')
depends=(python-pulsectl python-pyudev python-dbus-next pyside6 python-pyusb python-ruamel-yaml)
makedepends=(uv python-installer git)
checkdepends=()
source=("https://github.com/elegos/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
install="linux-arctis-manager.install"
sha256sums=('de6bde08b7d51c34467c6217a94dc06833d78dc298e74a490f6f6c9ad7bb34c3')

pkgver(){
	cd "$_pkgname"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	uv build
}

package() {
	cd "$_pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl

}

