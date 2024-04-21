# Maintainer: Anton Karmanov <a.karmanov@inventati.org>

pkgname=pixelfeeder
pkgver='0.2.0'
pkgdesc='Pixelfed import/export 3rd-party tool'
pkgrel=1
arch=(any)
url="https://gitlab.com/bergentroll/${pkgname}"
license=('Apache-2.0')
depends=(
  'python>=3.10'
  'python-argcomplete'
  'python-httpx'
  'python-pillow'
  'python-yaml'
  'python-xdg-base-dirs')
optdepends=('tk: for pixelfeeder-gui')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("${pkgname}::${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('893e2d01b3b4ad58f04052484d6567ff9c21204abb22451b0ea78d035e2e9ded')
_tardir="${pkgname}-v${pkgver}"

build() {
  cd "${srcdir}/${_tardir}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_tardir}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "assets/pixelfeeder.desktop" -t "$pkgdir/usr/share/applications/"
}
