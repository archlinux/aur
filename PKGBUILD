# Maintainer: Carneiro <gabriel dot chaves dot carneiro at gmail dot com>
pkgname=pulsemeeter-git
_pkgname=pulsemeeter
pkgver=1.2.5.r0.c17d992
pkgrel=1
pkgdesc="A pulseaudio audio routing application"
url="https://github.com/theRealCarneiro/pulsemeeter"
arch=('i686' 'x86_64')
license=('MIT')
depends=('python' 'python-gobject' 'python-appdirs' 'python-pulsectl' 'pulse-vumeter-git' 'gtk3' 'noise-suppression-for-voice' 'swh-plugins')
provides=('pulsemeeter')
makedepends=('git' 'python-setuptools')
optdepends=('glade: customize interface' 'pulseaudio' 'pipewire-pulse')
source=(${_pkgname}::git+${url}.git)
md5sums=('SKIP')

pkgver(){
	cd $_pkgname
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g; s/.//')"
}

build() {
	cd $_pkgname
	python setup.py build
}

package() {
	cd $_pkgname
	python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
}
