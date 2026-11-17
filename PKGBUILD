# Maintainer: A. Karmanov <a.karmanov@inventati.org>

pkgname=gixy-next
pkgver=0.13.0
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
sha512sums=('28082ec837aad76877f764c80e14ce1e9e7f118c3fef9f1fadccb74368342a059b7143b1b267eb4bb56d22f1922acfb964f01f9c37b745c0612505d8005a8e3c')
b2sums=('63c185e11bcd2ee0b24bc55f322917af4b881d07da446d0a4e76cb223b6878e71536084a06a7c22bb251355f9e65788c4aebd1f8dfb558f31a4ee08498a45654')

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
