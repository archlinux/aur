# Maintainer: Neko_Rikka <yjzyl9008 at gmail dot com>

pkgname=python-creart-git
pkgver=r17.7fa2f7f
pkgrel=1
pkgdesc="a universal, extensible class instantiation helper."
arch=('x86_64')
url="https://github.com/GraiaProject/creart"
license=('MIT')
provides=('python-creart')
conflicts=('python-creart')
depends=(
  'python-importlib-metadata'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'git')

source=("git+https://github.com/GraiaProject/creart.git")
md5sums=('SKIP')

pkgver() {
  cd creart
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd creart
  python -m build --wheel --no-isolation
}

package() {
  cd creart
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
