# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>

pkgname=ushift
pkgver=0.3.4
pkgrel=1
pkgdesc='CLI tool to manage CPU performance scaling and power profiles'
arch=('x86_64')
url='https://github.com/doums/ushift'
license=('Apache-2.0 WITH Commons-Clause')
depends=('glibc' 'systemd-libs')
makedepends=('zig')
provides=('ushift')
conflicts=('ushift')
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
#source=("$pkgname-$pkgver::git+file://${PWD}/../..")
sha256sums=('904dd4059316e6cce0ee214557ac200768f5ddce16b6ad4fbeb744d567f1d62e')
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

