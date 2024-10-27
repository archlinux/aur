# Maintainer: Ondřej Hošek <ondra.hosek@gmail.com>
pkgname=python-enocean-git
_name="enocean"
pkgver=0.31.r174.80a253b
pkgrel=2
pkgdesc="EnOcean library for Python"
arch=("any")
url="https://github.com/kipe/enocean"
license=('MIT')
groups=()
depends=('python' 'python-beautifulsoup4' 'python-pyserial')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${_name}::git+https://github.com/kipe/enocean.git"
	"https://github.com/kipe/enocean/pull/138.patch")
noextract=()
sha512sums=('SKIP'
            '3c1585ce10832788b79776c5f1dd255b364a7d5763a91e05295e005c2ec8ad26e2cf6456b801cf77762cf0a2e975871a9f3a71904fef134496fd21537dc41a24')

pkgver() {
	cd "$srcdir/${_name}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${_name}"
	patch -Np1 -i "../138.patch"
}

build() {
	cd "$srcdir/${_name}"
	python setup.py build
}

package() {
	cd "$srcdir/${_name}"
	python setup.py install --root="$pkgdir" --optimize=1
}
