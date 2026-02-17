# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>

pkgname=checkup
pkgver=0.1.5
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
sha256sums_x86_64=('093503118f91fd7273c5fec799514a63a573cd065b40e5fba4e6fadfdeb6cedb')
sha256sums_aarch64=('2f06af33f93756523da6e37f13ed145f1b9666dedfbafe2959ac85830b7ca09a')

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
