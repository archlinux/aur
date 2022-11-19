# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=sphinx_basic_ng
pkgname=python38-sphinx-basic-ng
pkgver=1.0.0b1
pkgrel=1
pkgdesc='Modernised skeleton for Sphinx themes'
arch=('any')
url=https://github.com/pradyunsg/sphinx-basic-ng
license=('MIT')
depends=('python38-sphinx')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools' 'python38-wheel')
source=("https://files.python38hosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('89374bd3ccd9452a301786781e28c8718e99960f2d4f411845ea75fc7bb5a9b0')
b2sums=('1362364d8f6acbc3a0f3ded11b22879b3dfd6a9f2c746d800ea988ff852c16ab4f0aca7c9ef6d45020d978bb6bd0e7c54c775d00b3ba85b469471504ed4a54bc')

build() {
  cd $_name-$pkgver
  python3.8 -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd $_name-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python3.8 -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/$_name-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
