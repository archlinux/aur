# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>

pkgname=ushift
pkgver=0.1.0
pkgrel=2
pkgdesc='CLI tool to manage CPU performance scaling and power profiles'
arch=('x86_64')
url='https://github.com/doums/ushift'
license=('Apache-2.0 WITH Commons-Clause')
depends=('glibc' 'systemd-libs')
makedepends=('zig-master')
provides=('ushift')
conflicts=('ushift')
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
#source=("$pkgname-$pkgver::git+file://${PWD}/../..")
sha256sums=('595f7683301f928b6cc5001cbd78ba47de29f9cc74161ea862cecd7f4857a917')
backup=('etc/ushift/config.toml')
_pkgdir="$pkgname-$pkgver"

build() {
  cd "$srcdir/$_pkgdir"
  zig build -Doptimize=ReleaseSmall --prefix "${srcdir}/zig-out"
}

package() {
  cd "$srcdir/$_pkgdir"
  install -Dm755 "$srcdir/zig-out/bin/ushift" "$pkgdir/usr/bin/ushift"
  install -Dm644 "$srcdir/$_pkgdir/.pkg/config.toml" "$pkgdir/etc/ushift/config.toml"
  install -Dm644 "$srcdir/$_pkgdir/.pkg/ushift-laptop.service" "$pkgdir/usr/lib/systemd/system/ushift-laptop.service"
  install -Dm644 "$srcdir/$_pkgdir/.pkg/ushift-perf.service" "$pkgdir/usr/lib/systemd/system/ushift-perf.service"
}

