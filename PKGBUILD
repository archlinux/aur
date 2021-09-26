# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=unsilence
pkgver=1.0.8
pkgrel=1
pkgdesc='Console Interface and Library to remove silent parts of a media file'
arch=('any')
url='https://github.com/lagmoellertim/unsilence'
license=('MIT')
depends=('ffmpeg' 'python' 'python-argparse' 'python-rich')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('bd377d279ae155d02cc29cb6fbe836021c2ca2d1bc2766675c0beeb2f50c9e43')

build() {
  cd "${pkgname}-${pkgver}"
  sed -i 's/9.10.0/10.11.0/' requirements.txt
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'
  rm -r "${pkgdir}/usr/lib/python"*'/site-packages/examples'
}
