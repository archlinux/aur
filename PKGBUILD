# Maintainer: Jax Young <jaxvanyang@gmail.com>
pkgname=bdebstrap
pkgver=0.7.0
pkgrel=1
pkgdesc="YAML config based multi-mirror Debian chroot creation tool"
arch=('any')
url="https://github.com/bdrung/bdebstrap"
license=('ISC')
depends=('mmdebstrap' 'python-ruamel-yaml' 'python' 'sh')
makedepends=('python-setuptools' 'pandoc')
checkdepends=(
	'python-black'
	'python-isort'
	'python-pylint'
	'flake8'
	'shellcheck'
	'mypy'
	'python-types-setuptools'
)
optdepends=(
	'debian-archive-keyring: Debian PKI support'
	'ubuntu-keyring: Ubuntu PKI support'
	'qemu-user-static: foreign-architecture support'
	'qemu-user-static-binfmt: foreign-architecture support'
	'arch-test: foreign-architecture support')
source=(
	"https://github.com/bdrung/bdebstrap/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz"
)
sha256sums=('31b657c94a0f44d9f8f10c1fc4eba79ed38767af13bf7072f36fdda707e7c0b0')

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
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
