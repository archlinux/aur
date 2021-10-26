# Maintainer: Naya Verdier <n at yaverdier dot com>
pkgname=instater
pkgver=0.3.0
pkgrel=1
pkgdesc='An easy solution for system/dotfile configuration'
arch=('any')
url=https://github.com/nayaverdier/instater
license=('MIT')
depends=('python' 'python-jinja' 'python-passlib' 'python-rich' 'python-yaml')
makedepends=('python-build' 'python-install' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/i/instater/instater-$pkgver.tar.gz")
sha256sums=('c49e65f6549d037ba9cb828eccba3cb08f10b3f29f051f72aeef2db4e213ba1b')
b2sums=('283d69d24c21f2bb2ae1213d26cf198c0fd7af2cb141bb2bdd067d9de8ad580c27b4424d674543b240fb392e55358a6f08bdd7b86fc348c80defe8ac5efca4f3')

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
