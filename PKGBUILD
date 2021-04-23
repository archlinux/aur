# Maintainer: Streaksu <assemblyislaw@gmail.com>
pkgname=mantissa
pkgver=1.4.0
pkgrel=1
pkgdesc="A webkit-based browser made in D and with a fair share of love"
arch=("i686" "x86_64")
url="https://github.com/streaksu/mantissa"
license=('BSL')
source=("git+https://github.com/streaksu/mantissa.git#tag=v$pkgver")
sha256sums=('SKIP')
makedepends=('dub' 'ldc' 'pkgconfig')
depends=('webkit2gtk>=2.30.4' 'sqlite3>=3.34.0')
optdepends=('gst-libav: Support for some online video codecs')

build() {
  cd "${srcdir}/mantissa"
  dub upgrade
  dub build --build=release-nobounds
}

package() {
  cd "${srcdir}/mantissa"
  PREFIX=/usr DESTDIR="${pkgdir}" ./linux-install.sh
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
