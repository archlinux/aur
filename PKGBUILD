# Maintainer:
# Contributor: Alois Nešpor <info@aloisnespor.info>
# Contributor: Pedro Martinez-Julia <pedromj@um.es>

_pkgname="libva-intel-driver"
pkgname="$_pkgname-g45-h264"
pkgver=2.4.1
pkgrel=1
pkgdesc="VA-API implementation for Intel G45 with H264 support"
url="https://bitbucket.org/alium/g45-h264"
license=('MIT')
arch=('i686' 'x86_64')

depends=(
  'libva'
  'libdrm'
)
makedepends=(
  'git'
  'meson'
  'xorgproto'
)

provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

_pkgsrc="intel-vaapi-driver"
source=("https://bitbucket.org/alium/g45-h264/downloads/intel-driver-g45-h264-$pkgver.tar.gz")
sha256sums=('f9d18a4b9d5007bc606d125b553a3d053d3295dd295ea477e43396a751e706fd')

build() {
  cd "$_pkgsrc"
  ./autogen.sh --prefix=/usr
  make
}


package() {
  cd "$_pkgsrc"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}
