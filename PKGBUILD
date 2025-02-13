# Maintainer: Neko_Rikka <yjzyl9008 at gmail dot com>

pkgname=python-unitypylive2dextractor-git
_pkgname=UnityPyLive2DExtractor
pkgver=r33.36436a4
pkgrel=1
pkgdesc="General purpose Live2D Asset recovery tool."
arch=('x86_64')
url="https://github.com/mos9527/UnityPyLive2DExtractor"
license=('MIT')
provides=('unitypylive2dextractor')
conflicts=('python-unitypylive2dextractor')
depends=(
  'python-sssekai-git'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'git')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${_pkgname}
  python -m build --wheel --no-isolation
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
