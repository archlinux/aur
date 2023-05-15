pkgname=python-webdav4
_name=webdav4
pkgver=0.9.8
pkgrel=2
pkgdesc='WebDAV client library with a fsspec based filesystem and a CLI.'
arch=('any')
url=https://github.com/skshetry/webdav4
license=('MIT')
depends=('python-httpx' 'python-dateutil' 'python-colorama' 'python-typing_extensions' 'python-fsspec')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' 'python-hatch-vcs')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('fc7748df33a375de13ddb5f4594f5799f9f3dc13c005b7b9c45c120aad745694')

build() {
cd $_name-$pkgver
python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
cd $_name-$pkgver
}

package() {
cd $_name-$pkgver
python -m installer --destdir="$pkgdir" dist/*.whl

# Symlink license file
local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
install -d "$pkgdir"/usr/share/licenses/$pkgname
ln -s "$site_packages"/$pkgname-$pkgver.dist-info/licenses/LICENSE \
"$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
