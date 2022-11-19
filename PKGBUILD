# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python38-imagesize
pkgver=1.4.1
pkgrel=2

pkgdesc='Analyzes JPEG/JPEG 2000/PNG/GIF/TIFF/SVG/Netpbm/WebP image headers and returns image size or DPI'
url='https://github.com/shibukawa/imagesize_py'
arch=('any')
license=('MIT')

depends=('python38')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools'
             'python38-wheel')

source=("https://files.pythonhosted.org/packages/source/i/imagesize/imagesize-$pkgver.tar.gz")

sha256sums=('69150444affb9cb0d5cc5a92b3676f0b2fb7cd9ae39e947a5e11a36b4497cd4a')

build() {
  cd imagesize-$pkgver
  python3.8 -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd imagesize-$pkgver
  python3.8 -m unittest discover -v
}

package() {
  cd imagesize-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python3.8 -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/imagesize-$pkgver.dist-info/LICENSE.rst \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.rst
}
