# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>

pkgname=upi
pkgver=0.1.4
pkgrel=1
pkgdesc="A simple, lightweight Rust daemon that monitors URLs and triggers local scripts when content changes."
arch=('x86_64' 'aarch64')
url="https://github.com/skorotkiewicz/upi"
license=('MIT')
install=upi.install
depends=('gcc-libs' 'glibc')
provides=('upi')
conflicts=('upi')
backup=('etc/upi/config.yml')

source=('upi.service' 'LICENSE' 'config.yml')
source_x86_64=("upi-x86_64::$url/releases/download/v$pkgver/upi-linux-x86_64")
source_aarch64=("upi-aarch64::$url/releases/download/v$pkgver/upi-linux-aarch64")

sha256sums=('a5d12ca0c57474b67dab20bf45594c07a150a2376f1e471e08d7164a9d442d06'
            '184086b302ece79e686ac701ca404fe7a49499626c82f684dce1b820af59710c'
            'da1e611bb45ad10dc0c99e05c08ef81eb2a3069dc77b3d5c25b2a8f1c663097f')
sha256sums_x86_64=('f1ed3dec79cb28dd25fb3162ef603283d795b1d78159a74111cad4ddf0bbd472')
sha256sums_aarch64=('b7d28f6c2347a9bc8a421690ed3ecbba4ebcf3190392207ccc52deab4a531b47')

package() {
  if [ "$CARCH" == "x86_64" ]; then
    _bin="upi-x86_64"
  elif [ "$CARCH" == "aarch64" ]; then
    _bin="upi-aarch64"
  fi

  # Binaries and Service
  install -Dm755 "$srcdir/$_bin" "$pkgdir/usr/bin/upi"
  install -Dm644 "$srcdir/upi.service" "$pkgdir/usr/lib/systemd/system/upi.service"
  
  # Config
  install -Dm644 "$srcdir/config.yml" "$pkgdir/etc/upi/config.yml"
  
  # License
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
