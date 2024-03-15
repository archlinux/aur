# Maintainer: Jax Young <jaxvanyang@gmail.com>
pkgname=bdebstrap
pkgver=0.6.1
pkgrel=1
pkgdesc="YAML config based multi-mirror Debian chroot creation tool"
arch=('any')
url="https://github.com/bdrung/bdebstrap"
license=('ISC')
depends=('mmdebstrap' 'python-ruamel-yaml' 'python' 'sh')
makedepends=('pandoc' 'python-setuptools')
checkdepends=(
	'python-black'
	'python-isort'
	'python-pylint'
	'flake8'
	'shellcheck')
optdepends=(
	'debian-archive-keyring: Debian PKI support'
	'ubuntu-keyring: Ubuntu PKI support'
	'qemu-user-static: foreign-architecture support'
	'qemu-user-static-binfmt: foreign-architecture support'
	'arch-test: foreign-architecture support')
source=(
	"https://github.com/bdrung/bdebstrap/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz"
)
sha256sums=('e031d542da3b8163e7570e60dfca895314ca50a15a2e5f6e63737cda61ea5289')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

check() {
	cd "$pkgname-$pkgver"
	python -m unittest discover -v
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
