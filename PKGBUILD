# Maintainer: tarball <bootctl@gmail.com>

pkgname=homebox-bin
pkgver=0.20.2
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
sha256sums_aarch64=('fc341e15f73c8cc5114b9663b097e971c8686bbf9a8d3827a27c9b3b5af45e69')
sha256sums_armv6h=('2019c7aeff1a0210f777f2e8ac6955760d7f432905d32b0cf1d715e229b05761')
sha256sums_i686=('94b2d3f669286f225938c46380f21e1038fe6203079939b04bab5bd2f5c07450')
sha256sums_riscv64=('6cad5ce779ef14d79c43c3acae2bf646e7a2d35b914a1d8bcfdd1e978bf55991')
sha256sums_x86_64=('727ceefb952c40ca7c4f65f579e17cc7c85b4a2f7cd8928fbf34095e7acd5159')

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
