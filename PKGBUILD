# Maintainer: Carneiro <gabriel dot chaves dot carneiro at gmail dot com>
pkgname=pulsemeeter-git
_pkgname=pulsemeeter
pkgver=2.0.0.r0.54b7691
pkgrel=1
pkgdesc="A pulseaudio and pipewire audio routing application"
url="https://github.com/theRealCarneiro/pulsemeeter"
arch=('i686' 'x86_64')
license=('MIT')
depends=('pipewire-pulse' 'gtk3' 'libayatana-appindicator' 'python' 'python-gobject' 'python-pydantic' 'python-pulsectl' 'python-pulsectl-asyncio')
provides=('pulsemeeter')
makedepends=('git' 'python-build' 'python-setuptools' 'python-installer' 'python-wheel' 'python-babel')
optdepends=('easyeffects')
source=(${_pkgname}::git+${url}.git)
md5sums=('SKIP')

pkgver(){
	cd $_pkgname
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g; s/.//')"
}

build () {
	cd $_pkgname
	python -m build --wheel --no-isolation
}

package() {
	cd $_pkgname
	python -m installer --destdir="$pkgdir" dist/*.whl
}
