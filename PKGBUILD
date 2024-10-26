# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=hush-lightwalletd
_name='lightwalletd'
pkgver=0.2.0
pkgrel=1
pkgdesc='HUSH Lightwallet daemon for running SDL servers'
url='https://git.hush.is/hush/lightwalletd'
arch=('x86_64')
license=('GPL-3.0-or-later')
makedepends=('go')
provides=('lightwalletd')
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('8a9baf9241449caccd3b753f15fd20c37fb5b4a58e89fa8d07d52fb52ef3470dd1a3951dac725ed33ab17173c6a4b944c169debf1b02d8432180e6dc42655343')

build() {
  cd "$_name"
  make build
}

package() {
  install -Dm755 "${srcdir}/$_name/lightwalletd" "${pkgdir}/opt/$pkgname/lightwalletd"
  install -Dm644 "${srcdir}/$_name/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "${srcdir}/$_name/doc/man/lightwalletd.1" "${pkgdir}/usr/share/man/man1/lightwalletd.1"

  # links to /usr/bin
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/lightwalletd "${pkgdir}/usr/bin"
}
