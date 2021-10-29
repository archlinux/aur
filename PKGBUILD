# Maintainer: Naya Verdier <n at yaverdier dot com>
pkgname=instater
pkgver=0.5.0
pkgrel=1
pkgdesc='An easy solution for system/dotfile configuration'
arch=('any')
url=https://github.com/nayaverdier/instater
license=('MIT')
depends=('python' 'python-jinja' 'python-passlib' 'python-rich' 'python-yaml')
makedepends=('python-build' 'python-install' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/i/instater/instater-$pkgver.tar.gz")
sha256sums=('c337fddd76c6dbdaf56924cd428adc1a80e87a566cce37d779af479ad3d14afc')
b2sums=('671baee89d826800e2c7b818ef55f84f729ff996e8cc252582518822409ae5352646425149622fc9c0c63ed08d70baccde946ef5451b36cdbc563dca2cd1b27a')

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
