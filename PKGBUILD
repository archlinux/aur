# Maintainer: back-to <backto at protonmail dot ch>

pkgname=livecli
pkgver=4.0.5
pkgrel=1
pkgdesc="CLI that pipes videos from online streaming services to a video player"
arch=("any")
url="https://livecli.github.io/"
license=("BSD")
depends=("python-"{isodate,pycountry,requests})
optdepends=(
  "ffmpeg: Required to play streams that are made up of separate audio and video streams"
  "python-pycryptodome: Required to play some encrypted streams"
  "python-pysocks: Required for socks proxies"
  "python-websocket-client: Required for some plugins"
  "rtmpdump: Required to play rtmp streams"
)
makedepends=("python-setuptools")
checkdepends=("python-"{freezegun,mock,pytest,requests-mock})
sha256sums=("f8a26dad0f1d33ea7b2ff8110dba26d6ff8e93f983ff120331b47c2eeddd5042")
source=("https://github.com/${pkgname}/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")

build() {
  cd "$pkgname-$pkgver"
  export LIVECLI_USE_PYCOUNTRY="true"
  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  python setup.py test
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
