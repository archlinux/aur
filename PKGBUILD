# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=unsilence
pkgver=1.0.5
pkgrel=1
pkgdesc='Console Interface and Library to remove silent parts of a media file'
arch=('any')
url='https://github.com/lagmoellertim/unsilence'
license=('MIT')
depends=('ffmpeg' 'python-argparse' 'python-rich')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('326b85b8c58660962d2d7880e0e44dada2be2bdd9830dc0285cbee718d382ef7')

prepare() {
  # https://github.com/lagmoellertim/unsilence/commit/30581844096967a736cc0ea8e17abb3dbd8f81ee
  sed -i 's/ffmpeg version /ffmpeg version \\D\?/' "${pkgname}-${pkgver}/unsilence/lib/tools/ffmpeg_version.py"
}

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 'README.md' "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
