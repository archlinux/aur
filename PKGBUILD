# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>

pkgname=checkup
pkgver=0.1.2
pkgrel=1
pkgdesc="Repository release tracker"
arch=('x86_64' 'aarch64')
url="https://github.com/skorotkiewicz/checkup"
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=('checkup')
conflicts=('checkup')
options=('!debug')
install=checkup.install

source=('LICENSE' 'checkup.service' 'checkup.install')
source_x86_64=("checkup-x86_64-$pkgver-$pkgrel::$url/releases/download/v$pkgver/checkup-linux-x86_64")
source_aarch64=("checkup-aarch64-$pkgver-$pkgrel::$url/releases/download/v$pkgver/checkup-linux-aarch64")

sha256sums=('184086b302ece79e686ac701ca404fe7a49499626c82f684dce1b820af59710c'
            '497a8322a8df697d6547bded2672aee9828fc0b372a5690c99f504b2cdb15027'
            '46f32d04d4a3a8a95c9be0eb68fb6faad63b21c34cca38c88b970f2136468959')
sha256sums_x86_64=('e6c3dcfee5868d9f699057f016ecd19c696ce8aacfd3b81bf3e39761a8eab9ed')
sha256sums_aarch64=('af19ecfc615391e8126029ccf28a7d542be88b81c8a010b0db9878bf1ec63128')

package() {
  if [ "$CARCH" == "x86_64" ]; then
    _bin="checkup-x86_64-$pkgver-$pkgrel"
  elif [ "$CARCH" == "aarch64" ]; then
    _bin="checkup-aarch64-$pkgver-$pkgrel"
  fi

  # Binaries and Service
  install -Dm755 "$srcdir/$_bin" "$pkgdir/usr/bin/checkup"

  # Service
  install -dm750 "$pkgdir/var/lib/checkup"
  install -Dm644 "$srcdir/checkup.service" "$pkgdir/usr/lib/systemd/system/checkup.service"

  # License
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
