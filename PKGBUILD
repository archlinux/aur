# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=qatlib
pkgver=21.11.0
pkgrel=2
pkgdesc="User space library for Intel(R) QuickAssist Technology"
url="https://github.com/intel/qatlib"
license=('BSD')
arch=('any')
dependes=()

source=(
  "$url/archive/refs/tags/$pkgver.tar.gz"
  "qatlib.sysusers"
)
sha256sums=(
  '0fd827cca1ea5ffa7302d560759329141843aee09251f1226c7f3e5e8e2b3ecd'
  '67ccaef8fc91484bf103ee6e321d03f820f633cc2a8d73926b568bd9a358bd8f'
)

build() {
  cd "$pkgname-$pkgver"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make \
    prefix="$pkgdir/usr" \
    sbindir="$pkgdir/usr/bin" \
    systemdsystemunitdir="$pkgdir/usr/lib/systemd/system" \
    systemd_scriptsdir="$pkgdir/usr/bin" \
  install
  install -Dm644 "$srcdir/qatlib.sysusers" "$pkgdir/usr/lib/sysusers.d/qatlib.conf"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
