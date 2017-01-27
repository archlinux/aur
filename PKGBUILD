# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=streamlink
pkgver=0.3.0
pkgrel=3
pkgdesc='CLI program that launches streams from various streaming services in a custom video player (livestreamer fork)'
arch=('any')
url='https://streamlink.github.io/'
license=('BSD')
depends=('python-pycryptodome' 'python-requests' 'rtmpdump')
checkdepends=('python-mock' 'python-pytest')
makedepends=('python-setuptools' 'python-sphinx')
optdepends=('ffmpeg: Required to play streams that are made up of separate audio and video streams, eg. YouTube 1080p+'
            'python-librtmp: Required by the ustreamtv plugin to be able to use non-mobile streams.')
#source=("https://github.com/${pkgname}/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.asc})
source=('https://src.fedoraproject.org/lookaside/pkgs/python-streamlink/streamlink-0.3.0-without-win32-binaries.tar.gz/sha512/753a41a13af88c11cff1b8b1e3a422b3eb9fe97516d2e33ec2460cb0560b1400af74de91def833dd1c904082e32f4d744ddd7ec7992c6fdb028e27e2a312d099/streamlink-0.3.0-without-win32-binaries.tar.gz')
# Charlie Drage <charlie@charliedrage.com>
# validpgpkeys=('1D2DA4B582D3E09EFA2C997CDA227403C037D617')
sha512sums=('753a41a13af88c11cff1b8b1e3a422b3eb9fe97516d2e33ec2460cb0560b1400af74de91def833dd1c904082e32f4d744ddd7ec7992c6fdb028e27e2a312d099')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build_sphinx -b man
}

check() {
  cd "$pkgname-$pkgver"
  python setup.py test || warning "Tests failed"
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 build/sphinx/man/streamlink.1 \
    "$pkgdir/usr/share/man/man1/streamlink.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
