# Maintainer: A. Karmanov <a.karmanov@inventati.org>

pkgname=gixy-next
pkgver=0.12.0
pkgrel=1
pkgdesc='Nginx configuration static analyzer'
arch=('any')
url='https://gixy.io'
license=('MPL-2.0')
depends=(
  'crossplane-gixy'  # Maintained crossplane fork
  'python'
  'python-configargparse'
  'python-jinja'
  'python-tldextract'
)
optdepends=(
  'python-requests: ReDoS checks via external API'  # namcap gives false-positive warning
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
conflicts=('gixy' 'gixy-git' 'gixy-ng' 'gixy-ng-git')
_srcname="Gixy-Next-${pkgver}"
_distname="gixy_next-${pkgver}-py3-none-any.whl"
source=("${_srcname}.tar.gz::https://github.com/MegaManSec/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('e3d9cc330ed0b2562d579b7a47f01f4863dad75d4a54b4ac46fe7c1db8ad26e298289e4a1b797bcb086110c15ad15748a963a9585d87439d38b81db24065c6e6')
sha512sums=('37b8be8d2f22ebc22d717440851300146d30bf7844673aa2b1a1d99b91d212d598a82dc0f4d1ecd1c48bb6134a9eb960f3e96c54dfa09adbe26f749d5188c4b1')

build() {
  cd "$_srcname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_srcname"
  pytest
}

package() {
  cd "$_srcname"
  python -m installer --destdir="$pkgdir" "dist/${_distname}"
}
