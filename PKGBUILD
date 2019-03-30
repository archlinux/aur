# Maintainer: Benedikt Vollmerhaus <aur[at]vollmerhaus[dot]org>

pkgname=blurwal
pkgver=1.1.1
pkgrel=1
pkgdesc='Smoothly blurs the wallpaper when windows are opened.'
arch=('any')
url="https://gitlab.com/BVollmerhaus/${pkgname}"
license=('MIT')
depends=('python')
optdepends=('libnotify: for displaying status notifications')
makedepends=('python-setuptools')
source=("https://gitlab.com/BVollmerhaus/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('492fcfc820f1679440cf8aee56b0634aad1eedc0635280c037214aa53cff72be')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${pkgname}-${pkgver}"
  python setup.py test
}

package() {
  depends=('imagemagick')
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
