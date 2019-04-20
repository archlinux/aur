# Maintainer: David Adler <d.adler@posteo.de>

_pkgname=nekobee
pkgname=$_pkgname-git
pkgver=0.1.8.r2.593d4be
pkgrel=2
pkgdesc="a DSSI softsynth recreation of a classic single-oscillator bass monosynth"
arch=('x86_64')
url="https://github.com/gordonjcp/nekobee"
license=('GPL')
depends=('gtk2' 'liblo')
makedepends=('git' 'dssi' 'python2' 'ladspa') 
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(git+https://github.com/gordonjcp/nekobee.git)
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd $_pkgname
	python2 ./waf configure --prefix=/usr
	python2 ./waf
}

package() {
	cd $_pkgname
    python2 ./waf install --destdir="$pkgdir/"
    install -t "$pkgdir/usr/share/doc/$_pkgname/" \
        -vDm 644 README
}

