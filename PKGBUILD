# Maintainer: Ben Westover <kwestover.kw@gmail.com>
pkgname=python-rust2rpm
pkgver=20
pkgrel=1
pkgdesc="RPM macro/tools/junk for Rust"
arch=('any')
url="https://pagure.io/fedora-rust/rust2rpm"
license=('MIT')
depends=('python' 'python-jinja' 'python-requests' 'python-tqdm')
makedepends=('python-setuptools')
optdepends=('python-pynacl: Voice support'
            'libffi: Voice support')
source=("https://pagure.io/fedora-rust/rust2rpm/archive/v20/rust2rpm-v${pkgver}.tar.gz")
sha256sums=('fa8b7d8fab5ed5a84a38c6f9f4a468671536e8a8e4e74affaf8f4ba1988b9327')

build() {
	cd "$srcdir"/rust2rpm-v${pkgver}
	python setup.py build
}

package() {
	cd "$srcdir"/rust2rpm-v${pkgver}
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
