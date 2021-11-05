# Maintainer: Naya Verdier <n at yaverdier dot com>
pkgname=instater
pkgver=0.7.0
pkgrel=1
pkgdesc='An easy solution for system/dotfile configuration'
arch=('any')
url=https://github.com/nayaverdier/instater
license=('MIT')
depends=('python' 'python-jinja' 'python-passlib' 'python-rich' 'python-yaml')
makedepends=('python-build' 'python-install' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/i/instater/instater-$pkgver.tar.gz")
sha256sums=('4cb95f668776cd1b3eee345edabe02f6f608fa6e4ea3b94fcdc4aff562d6e57c')
b2sums=('fbb4b78b642d5ec8c5b5c5fda50e6ed4a65fae9bd51c105cebf06b9e98492afe9cb3d71c301f47c6bb25ceb528fc02f6a89b12eda1218a5808ca65a62c5d918c')

build() {
  cd "instater-$pkgver"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "instater-$pkgver"
  python -m install --optimize=1 --destdir="$pkgdir" dist/*.whl

  chmod +x "$pkgdir"/usr/bin/*

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s $site_packages/instater-$pkgver.dist-info/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
