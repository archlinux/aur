# Maintainer: tarball <bootctl@gmail.com>

pkgname=homebox-bin
pkgver=0.23.1
pkgrel=1
pkgdesc='Inventory and organization system built for the Home User'
url='https://github.com/sysadminsmedia/homebox'
arch=('aarch64' 'riscv64' 'x86_64')
license=('AGPL-3.0-only')
provides=('homebox')
conflicts=('homebox')
depends=('glibc' 'libwebp' 'libavif' 'libheif' 'libjxl')

source=('homebox.service')
source_aarch64=("$url/releases/download/v$pkgver/homebox_Linux_arm64.tar.gz")
source_riscv64=("$url/releases/download/v$pkgver/homebox_Linux_riscv64.tar.gz")
source_x86_64=("$url/releases/download/v$pkgver/homebox_Linux_x86_64.tar.gz")

sha256sums=('bb759217a883f50712f98bbf2527136061a082ea5fd2c9db211ee15c98cb7150')
sha256sums_aarch64=('3a5d1c67ecccc3a8c897eec3685905032a98a7dc6f3246fd5ef3969b890af874')
sha256sums_riscv64=('b2aa18d8d4151081650410d7cebc378ec1ff46addd1db830f7572b8cf650b417')
sha256sums_x86_64=('74e274f85adff5ebd8c2a895f2ea8ab74cfc812e1ce4811fdfb3c7ed4d6b07e4')

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
