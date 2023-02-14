# Maintainer: Naya Verdier <n at yaverdier dot com>
pkgname=instater
pkgver=0.11.0
pkgrel=4
pkgdesc='An easy solution for system/dotfile configuration'
arch=('any')
url=https://github.com/nayaverdier/instater
license=('MIT')
depends=('python' 'python-jinja' 'python-passlib' 'python-rich' 'python-yaml')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/i/instater/instater-$pkgver.tar.gz")
sha256sums=('0f1543e8d421f882f5e9d97989d21be5739e897fdbc1fd3b53f72040bbd2983e')
b2sums=('da5fbc88cbc40eed768d974dd1e41722411230330d997b95e1d6eedff843a426088ef2051db6c7e5446fcbf28eb6ab9cd06aaf7c6c47e4af1b2cbb626612a79c')

build() {
  cd "instater-$pkgver"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "instater-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  chmod +x "$pkgdir"/usr/bin/*

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s $site_packages/instater-$pkgver.dist-info/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
