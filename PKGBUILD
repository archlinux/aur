# Maintainer: Gerard Ribugent <ribugent at gmail dot com>
pkgname=python-git-sim
_name=git-sim
pkgver=0.1.8
pkgrel=1
pkgdesc="Simulate Git commands on your own repos by generating an image (default) or video visualization depicting the command's behavior."
arch=('any')
url='https://initialcommit.com/tools/git-sim'
license=('MIT')
depends=(
  'manim'
  'python>=3.7'
  'python-gitpython'
  'python-opencv'
)
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('5e2dcac797515dffd79a93108c81c0bf9d97a358fc98fc22fab96b76a329b50ff8b0e6b66ee8a8feba0b14f6eb61aae7fc567e3b45aff6b7526842ec3878e0a8')


build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
