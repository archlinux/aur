# Maintainer: gilbus <aur (AT) tinkershell dot eu>
pkgname=frogmouth
_name=frogmouth
pkgver=0.9.1
pkgrel=1
pkgdesc="A Markdown browser for your terminal "
arch=('any')
url="https://github.com/textualize/frogmouth"
license=('MIT')
depends=('python-textual' 'python-httpx' 'python-typing_extensions' 'python-xdg-base-dirs' 'python-linkify-it-py')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-poetry-core')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        'xdg-base-dirs.patch')
sha256sums=('d7f3830f6f69f97602dd201b3fef6bb8083a69ff6985a0712749f03b4d0bb1c5'
            'fe6bcfd3b8c962be3a9a19a9bb46d7ebe33b973981ab7d092b5e225c552432fc')

prepare() {
	cd "$_name-$pkgver"
	patch -Np1 -i $srcdir/xdg-base-dirs.patch
}

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
