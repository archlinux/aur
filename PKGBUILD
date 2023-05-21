# Maintainer: éclairevoyant
# Contributor: redtide <redtid3 at gmail dot com>
# Contributor: Liam Greenough <beacon515 at gmail dot com>

_pkgname=ly2video
pkgname="$_pkgname-git"
pkgver=0.5.0.r0.g41364ad
pkgrel=1
pkgdesc="Generate videos from Lilypond sheet music files"
arch=(any)
url="https://github.com/aspiers/$_pkgname"
license=(GPL3)
depends=(ffmpeg lilypond python-mido python-pexpect python-pillow timidity++)
makedepends=(git python-setuptools)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
	git -C $_pkgname describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $_pkgname
	python setup.py build
}

package() {
	cd $_pkgname
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
