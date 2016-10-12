# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=streamlink
pkgver=0.0.2
pkgrel=1
pkgdesc='CLI program that launches streams from various streaming services in a custom video player (livestreamer fork)'
arch=('any')
url='https://streamlink.github.io/'
license=('BSD')
depends=('python-requests' 'python-setuptools' 'rtmpdump')
makedepends=('python-sphinx')
optdepends=('python-librtmp: Required by the ustreamtv plugin to be able to use non-mobile streams.')
source=("https://github.com/${pkgname}/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.asc})
validpgpkeys=('1D2DA4B582D3E09EFA2C997CDA227403C037D617')
sha256sums=('c443f46cfca540ecd04b6439e337d466f3bf9fc0df074bcfa69ad27ddb63c7a4' 'SKIP')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build_sphinx -b man
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 build/sphinx/man/streamlink.1 \
    "$pkgdir/usr/share/man/man1/streamlink.1"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
