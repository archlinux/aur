# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
_name=kitcat
pkgname=python-$_name
pkgver=2.0.2
pkgrel=2
pkgdesc="Matplotlib backend for direct plotting in the terminal using Kitty graphics protocol"
arch=(any)
url=https://github.com/mil-ad/kitcat
license=(MIT)
depends=(python-matplotlib)
makedepends=(python-uv-build python-build python-installer)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('21a09d2ec322f46019d7a4a3fea64fba816bf631250e013f50944a1c42e09c0c')

prepare() {
  cd $_name-$pkgver
  # Allow the uv-build version packaged by Arch.
  sed -i 's/uv_build>=0.11.13,<0.12.0/uv_build>=0.11.13/' pyproject.toml
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
