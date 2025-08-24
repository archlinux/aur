# Maintainer: tarball <bootctl@gmail.com>

pkgname=homebox-bin
pkgver=0.21.0
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
sha256sums_aarch64=('01e00bc15892f533870afee54770c59efde6df8e7463ab5d6ad70660a4f19823')
sha256sums_armv6h=('9c03d968af5047beceb1e47014b023dc3f249de30b5a9342b1f0d755d22348bd')
sha256sums_i686=('b40e92a6afe1a7015d165b0ce81313b892657c7e9a85de4875fc5cf8dac5ef7c')
sha256sums_riscv64=('94149901d23a5a5e43c7cad4ef086d05fa39d619c104f3c06d3a9b5f3a0ff76e')
sha256sums_x86_64=('84bc710fb45c1ce8e122fc11ca4ba0b4d4f1d2c6ad125b703c87980890b681bd')

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
