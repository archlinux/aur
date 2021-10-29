# Maintainer: Naya Verdier <n at yaverdier dot com>
pkgname=instater
pkgver=0.4.0
pkgrel=1
pkgdesc='An easy solution for system/dotfile configuration'
arch=('any')
url=https://github.com/nayaverdier/instater
license=('MIT')
depends=('python' 'python-jinja' 'python-passlib' 'python-rich' 'python-yaml')
makedepends=('python-build' 'python-install' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/i/instater/instater-$pkgver.tar.gz")
sha256sums=('dd4db84442fcf65adbdcf1c826eb558c3334797bfbc047646280c0c64a8d7b66')
b2sums=('ada141ee99bbba1f9db769e2e2a929c4457b62c8f5a37f05bb1c6fbb2c387b3c54cfd2bc7e81fff659f32d95e4a3aea651c529610e5e366e2168dba3bd2fe620')

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
