# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=streamlink
pkgver=0.0.1
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
sha256sums=('500c0e004cfd48dda72ccb0d46076adad8c871dc2dbd3c8ab32fdb15fb6c9ec9' 'SKIP')

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
