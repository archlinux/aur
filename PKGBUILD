# Maintainer: Tony M.J. <tonymj@proton.me>
pkgname=xlsxio
pkgver="0.2.36"
pkgrel=1
pkgdesc="C library for reading and writing .xlsx files"
arch=('x86_64')
provides=('xlsxio')
url=https://github.com/brechtsanders/xlsxio
license=('MIT')
depends=('expat' 'minizip')
source=("$url/releases/download/$pkgver/xlsxio-$pkgver.tar.xz")
sha256sums=('e696998a967f8397df2a34078bf2cea4bdbb7019718e908c4c8d8d687d554192')

package() {
  cd "$pkgname-$pkgver"
  make install PREFIX=$pkgdir/usr
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Upstream installs man pages into /usr/man instead of /usr/share/man Fix:
  if [[ -d "$pkgdir/usr/man" ]]; then
    mkdir -p "$pkgdir/usr/share"
    mv "$pkgdir/usr/man" "$pkgdir/usr/share/"
  fi
}
