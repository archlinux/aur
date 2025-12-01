# Maintainer: Jason Go <jasongo@jasongo.net>

pkgname="libjpeg-turbo-official"
pkgver=3.1.2
pkgrel=2
pkgdesc='Official binaries compiled by the libjpeg-turbo project (v6b API/ABI, libjpeg.so.62)'
arch=('x86_64' 'aarch64')
url='https://github.com/libjpeg-turbo/libjpeg-turbo'
license=('BSD-3-Clause' 'IJG')
depends=('glibc')
optdepends=('java-runtime>=8: for TurboJPEG Java wrapper')
provides=(
  'libjpeg6'
  'libjpeg.so.62'
  'libjpeg.so.62.4.0'
  'libturbojpeg.so.0'
  'libturbojpeg.so.0.4.0'
)
conflicts=('libjpeg6')
options=(!buildflags !makeflags !debug)
source_x86_64=("$url/releases/download/$pkgver/libjpeg-turbo-official_${pkgver}_amd64.deb")
source_aarch64=("$url/releases/download/$pkgver/libjpeg-turbo-official_${pkgver}_arm64.deb")
sha256sums_x86_64=('e42e8319a632a1e3f13fc394cf06d9bf017b2db1546d0b41d6d6246a8a979078')
sha256sums_aarch64=('d9c159ac87edcb4a3f56cbb39e3fb4b511bbcd40117775534b72a4b5b6741b8e')

package() {
  bsdtar -xvf data.tar.xz -C "$pkgdir"

  # Configure dynamic linker bindings
  mkdir -p "$pkgdir/etc/ld.so.conf.d/"
  echo "/opt/libjpeg-turbo/lib64" > "$pkgdir/etc/ld.so.conf.d/$pkgname.conf"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/usr/share/doc/libjpeg-turbo-official-$pkgver/"{LICENSE.md,README.ijg}
}
