# Maintainer: gilbus <aur (AT) tinkershell dot eu>
pkgname=frogmouth
_name=frogmouth
pkgver=0.8.0
pkgrel=1
pkgdesc="A Markdown browser for your terminal "
arch=('any')
url="https://github.com/textualize/frogmouth"
license=('MIT')
depends=('python-textual>=0.24.0' 'python-httpx' 'python-typing_extensions' 'python-xdg-base-dirs' 'python-linkify-it-py')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-poetry-core')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        'xdg-base-dirs.patch')
sha256sums=('a2ec36c1526ed59129747314494b93ffa67930562ffa4165c8819c65e1592f1e'
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
