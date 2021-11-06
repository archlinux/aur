# Maintainer: Naya Verdier <n at yaverdier dot com>
pkgname=instater
pkgver=0.8.0
pkgrel=1
pkgdesc='An easy solution for system/dotfile configuration'
arch=('any')
url=https://github.com/nayaverdier/instater
license=('MIT')
depends=('python' 'python-jinja' 'python-passlib' 'python-rich' 'python-yaml')
makedepends=('python-build' 'python-install' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/i/instater/instater-$pkgver.tar.gz")
sha256sums=('e754335651d83e9e1980d764b1191620136fbda999327200ef7e808e2b2863ad')
b2sums=('13395109bf8fd79c746c458a340e6ae64d671aed83e928801188a5e5d8423f641b73ef50af6485f5e5f579bbb267a20a375918f5112dbcd17e7c4d1fe59d95d9')

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
