# Maintainer: Neko_Rikka <yjzyl9008 at gmail dot com>

pkgname=python-bbpb-git
pkgver=r175.0eabe49
pkgrel=1
pkgdesc="A set of tools for working with encoded Protocol Buffers."
arch=('x86_64')
url="https://github.com/nccgroup/blackboxprotobuf"
license=('MIT')
provides=('python-bbpb')
conflicts=('python-bbpb')
depends=(
  'python'
  'python-six'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'git')
source=("git+https://github.com/nccgroup/blackboxprotobuf.git")
md5sums=('SKIP')

pkgver() {
  cd blackboxprotobuf
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd blackboxprotobuf/lib
  python -m build --wheel --no-isolation
  python -m installer --destdir="$pkgdir" dist/*.whl
  cd ..
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README" 
}
