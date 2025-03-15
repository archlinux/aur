# Maintainer: Angelo Dal Zotto <angelodalzotto97 at gmail dot com>
# Contributor: Rich Lees <git0 at bitservices.io>
# Contributor: Aaron Coach <aur at ezpz dot cz>
# Contributor: Alexandra Koch <alexandra@alexandrakoch.se>

pkgname=upliftpowerplay
_name=upp
pkgver=0.2.4
pkgrel=1
pkgdesc="UPP: A tool for parsing, dumping and modifying data in Radeon PowerPlay tables"
arch=('x86_64')
url="https://github.com/sibradzic/upp"
license=('GPL3')
depends=('python' 'python-click' 'python-setuptools')
optdepends=('python-registry: reading "soft" PowerPlay table from Windows registry')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://github.com/sibradzic/$_name/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('31f27d6e1ff9088259f10020fe7e5464')

build() {
	cd "$srcdir/$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 upliftpowerplay@.service "$pkgdir"/usr/lib/systemd/system/upliftpowerplay@.service
    install -dm755 "$pkgdir"/etc/upliftpowerplay
}
