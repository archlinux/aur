# Maintainer: Streaksu <assemblyislaw@gmail.com>
pkgname=mantissa
pkgver=1.3.0
pkgrel=1
pkgdesc="A webkit-based browser made in D and with a fair share of love"
arch=("i686" "x86_64")
url="https://github.com/streaksu/mantissa"
license=('BSL')
source=(${url}/archive/v1.3.0.tar.gz)
sha256sums=('5ccaef7f26b1e05c3d27ddd0273f02fd9dc9ec084259803098150134d34e6a91')
_dir="${pkgname}-${pkgver}"
makedepends=('dub' 'ldc' 'pkgconfig')
depends=('webkit2gtk>=2.30.4' 'sqlite3>=3.34.0')
optdepends=('gst-libav: Support for some online video codecs')

build() {
  make -C "${_dir}"
}

package() {
  dub build --build=release-nobounds
  PREFIX=/usr DESTDIR="${pkgdir}" ./linux-install.sh
  install -Dm644 "${_dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
