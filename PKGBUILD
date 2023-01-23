# Maintainer: Gerard Ribugent <ribugent at gmail dot com>
pkgname=python-git-sim
_name=git-sim
pkgver=0.1.2
pkgrel=1
pkgdesc="Simulate Git commands on your own repos by generating an image (default) or video visualization depicting the command's behavior."
arch=('any')
url='https://initialcommit.com/tools/git-sim'
license=('MIT')
depends=(
  'manim'
  'python'
  'python-gitpython'
  'python-opencv'
)
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('2a8f85621e088d7b11c33530fc2bfbd342b9ba499ba7814ed5e771580a7dc181960b056c93c0f07f741f731f4160fa4afe8114cb64f803d7f0b83e7ff4a562b3')


build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
