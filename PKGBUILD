# Maintainer: George Raven <GeorgeRavenCommunity AT pm dot me>
pkgname=python-pimoroni-bme680-git
_pkgsrcname="bme680-python"

pkgver=v1.0.5.r14.91434ca

pkgrel=1
pkgdesc="Python library for the BME680 gas, temperature, humidity, and pressure sensor."
arch=('any')
# pimoroni bme680 python source code url
url="https://github.com/DreamingRaven/bme680-python"
# set what branch you would like to pull from
_branch="master"
license=('MIT') # MIT is a special case store a copy in /usr/share/pkgname
groups=()
depends=("python")
makedepends=("git") # 'bzr', 'git', 'mercurial' or 'subversion'
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("${_pkgsrcname}::git+https://github.com/pimoroni/${_pkgsrcname}#branch=${_branch}")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgsrcname}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${_pkgsrcname}"
	git checkout ${_branch} # get off of makepkg branch
}

build() {
	cd "$srcdir/${_pkgsrcname}"
}

check() {
	cd "$srcdir/${_pkgsrcname}"
}

package() {
	cd "$srcdir/${_pkgsrcname}/library" # they store their setup.py here
	python3 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
	cd "$srcdir/${_pkgsrcname}" # returning to standard location
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
