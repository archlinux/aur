# Submitter: Rubens Brandão <construidor@gmail.com>
# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
pkgname=mosix
pkgver=4.4.4
pkgrel=1
pkgdesc="MOSIX is a management system for parallel computing on Linux clusters and multi-cluster clouds."
url="http://www.mosix.cs.huji.ac.il"
arch=('x86_64')
license=('custom:Mosix')
depends=('glibc')
optdepends=('lzop')
makedepends=()
conflicts=('mosix-tools' 'linux-mosix' 'linux-mosix-headers')
replaces=()
backup=()
source=("http://www.mosix.cs.huji.ac.il/mos4/MOSIX-${pkgver}.tbz"
								'mosix.service')
sha256sums=('68fb4ed239734d532cbe4868b73b0f9a388b35caf8e020d5032acfd53b673cfa'
	    										'b216039d8eefab0e54200ef1a393f8f10c1aa7d630d1e83865c27f39dd45b8fd')
validpgpkeys=('DE08F924EEE93832DABC642CA8DC761B1C0C0CFC')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  msg2 'installing binaries'
	# list binaries into mosixbinaries & install them
	mosixbinaries=$( grep -r -I -L . )
	for i in $mosixbinaries; do
		install -Dm755 $srcdir/$pkgname-$pkgver/$i $pkgdir/usr/bin/$i
	done
  mkdir -p $pkgdir/usr/share/mosix/man
  cp -ra man/* $pkgdir/usr/share/mosix/man/
  cp README $pkgdir/usr/share/mosix/README
	cp USER-GUIDE $pkgdir/usr/share/mosix/USER-GUIDE
	cp PROGRAMMER-GUIDE $pkgdir/usr/share/mosix/PROGRAMMER-GUIDE
	cp ADMINISTRATOR-GUIDE $pkgdir/usr/share/mosix/ADMINISTRATOR-GUIDE
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 $srcdir/mosix.service $pkgdir/usr/lib/systemd/system/mosix.service

  mkdir -p -m 755 $pkgdir/etc/mosix/partners
  mkdir -p -m 755 $pkgdir/var/mosix
  ln -s "/var/mosix" "$pkgdir/etc/mosix/var"
}

# vim:set ts=2 sw=2 et:
