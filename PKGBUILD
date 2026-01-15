# Maintainer: tarball <bootctl@gmail.com>

pkgname=homebox-bin
pkgver=0.22.3
pkgrel=1
pkgdesc='Inventory and organization system built for the Home User'
url='https://github.com/sysadminsmedia/homebox'
arch=('aarch64' 'armv6h' 'i686' 'riscv64' 'x86_64')
license=('AGPL-3.0-only')
provides=('homebox')
conflicts=('homebox')
depends=('glibc' 'libwebp' 'libavif' 'libheif' 'libjxl')

source=('homebox.service')
source_aarch64=("$url/releases/download/v$pkgver/homebox_Linux_arm64.tar.gz")
source_armv6h=("$url/releases/download/v$pkgver/homebox_Linux_armv6.tar.gz")
source_i686=("$url/releases/download/v$pkgver/homebox_Linux_i386.tar.gz")
source_riscv64=("$url/releases/download/v$pkgver/homebox_Linux_riscv64.tar.gz")
source_x86_64=("$url/releases/download/v$pkgver/homebox_Linux_x86_64.tar.gz")

sha256sums=('bb759217a883f50712f98bbf2527136061a082ea5fd2c9db211ee15c98cb7150')
sha256sums_aarch64=('3626a9a0325bd46d26b60d6fe9add51ceac7ce870c04f1a558e43fe499dd53b1')
sha256sums_armv6h=('adec8e3b7a647968dd034f53120c253b8b6c5c38b4d5cb5d2796348da5544908')
sha256sums_i686=('7691f34d71e6e3935f986696bddbb86ad212f47f7ab0090fb54293cf0f14e10d')
sha256sums_riscv64=('8f73b0cac5719b39c531d436b8b05e88803b55c5f475b1248cea8d8c234a7d35')
sha256sums_x86_64=('f04d8b0ae7cc31fd006bd414e9ff0f00ba6bd053b5047b220c8b8b414456ab37')

package() {
  install -Dm755 homebox -t "$pkgdir/usr/bin/"
  install -Dm644 homebox.service -t "$pkgdir/usr/lib/systemd/system/"

  install -Dm644 /dev/stdin "$pkgdir/etc/default/homebox" <<EOF
HBOX_OPTIONS_GITHUB_RELEASE_CHECK=false
HBOX_MODE=production
HBOX_STORAGE_CONN_STRING=file:///var/lib/homebox?no_tmp_dir=true
HBOX_STORAGE_PREFIX_PATH=data
HBOX_DATABASE_SQLITE_PATH=/var/lib/homebox/data/homebox.db?_pragma=busy_timeout=2000&_pragma=journal_mode=WAL&_fk=1&_time_format=sqlite

# Extra flags to pass to homebox
FLAGS=""
EOF
}
