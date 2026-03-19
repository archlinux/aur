# Maintainer: J. Gerhards <g1.jasger@gmail.com>
# Author: J. Gerhards <g1.jasger@gmail.com>

pkgname=mpdris-bin
_pkgname=mpdris
pkgver=1.3.0
pkgrel=1
pkgdesc='A MPD client implementing the dbus MPRIS standard written in rust -- binary version'
url='https://github.com/jasger9000/mpdris'
license=('MIT')
arch=('x86_64' 'i686' 'aarch64')
provides=("mpdris=${pkgver}")
conflicts=('mpdris')
depends=('glibc' 'libgcc')
optdepends=('libsystemd: run mpdris as a service')
source_x86_64=("${_pkgname}-v${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/mpdris_x86_64.tar.gz")
source_i686=("${_pkgname}-v${pkgver}-i686.tar.gz::${url}/releases/download/v${pkgver}/mpdris_i686.tar.gz")
source_aarch64=("${_pkgname}-v${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/mpdris_aarch64.tar.gz")
sha256sums_x86_64=('1902b8a175203ebbc2aa17226704eb4d54567e95e213e2d29702f58e6d38c54c')
sha256sums_i686=('073f7701cbd0098aa11baf1b36d445cb21c2f1bfa57cf0527afddc33b5f7bd2d')
sha256sums_aarch64=('6948c1ce91b5d93535c482e7c854bff68e1d671b97ed125038846ed5a0cfadfe')

package() {
  depends+=('dbus' 'mpd')

  install -Dm755 "$srcdir/mpdris" "$pkgdir/usr/bin/mpdris"
  install -Dm644 "$srcdir/mpdris.service" "$pkgdir/usr/lib/systemd/user/mpdris.service"
  install -Dm644 "$srcdir/sample.mpdris.conf" "$pkgdir/usr/share/doc/${pkgname}/sample.mpdris.conf"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  for section_dir in "$srcdir/man/man"*; do
      for file in "$section_dir"/*; do
          install -Dm644 "$file" "$pkgdir/usr/share/man/$(basename "$section_dir")/$(basename "$file").gz"
      done
  done
}
