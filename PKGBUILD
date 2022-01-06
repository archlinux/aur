# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=qatlib
pkgver=21.11.0
pkgrel=1
pkgdesc="User space library for Intel(R) QuickAssist Technology"
url="https://github.com/intel/qatlib"
license=('BSD')
arch=('any')
dependes=()

source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('0fd827cca1ea5ffa7302d560759329141843aee09251f1226c7f3e5e8e2b3ecd')

build() {
  cd "$pkgname-$pkgver"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make prefix="$pkgdir/usr" install systemdsystemunitdir="$pkgdir/usr/lib/systemd/system"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
