# Maintainer: Tyrolyean <tyrolyean@semi-professional.net>

pkgname=ftpsync
pkgver=20180513
pkgrel=1
pkgdesc='Scripts used for maintaining a Debian archive mirror (and shortly, a Debian bug mirror), but they should be easily generalizable.'
arch=('any')
url='https://salsa.debian.org/mirror-team/archvsync/'
license=('GPL-2.0-only')
depends=(
  'bash'
  'rsync'
  'inetutils'
)

makedepends=(
  'pandoc'
)

source=(
  "https://ftp-master.debian.org/${pkgname}.tar.gz"
)

sha512sums=('6c8f9b36011ab485ed0d747ee54016a38432433b61e8e9310ba0f0d615ee6ef760ae25ce56d6cc0e1260890a4deb7f3afbfaad7eaa59b0e61f1f70d4514f3eb3')
sha256sums=('f098ece22f2c8726e605bae2b6c4e1c81b9996e905e034ee937dc39a23459702')
md5sums=('f0984f4c184c7f054a327191e14b1fb5')

build() {
	cd $srcdir/distrib/doc
	for f in *.md
	do
		pandoc -s -t man -o $(basename -s.md $f) $f
	done
}

package() {
	install -vDm755 -t "$pkgdir/usr/bin" "distrib/bin/ftpsync"
	install -vDm755 -t "$pkgdir/usr/bin" "distrib/bin/ftpsync-cron"
	install -vDm755 -t "$pkgdir/usr/bin" "distrib/bin/rsync-ssl-tunnel"
	install -vDm755 -t "$pkgdir/usr/bin" "distrib/bin/runmirrors"
	install -vDm744 -t "$pkgdir/usr/share/doc/ftpsync/" "distrib/etc/ftpsync.conf.sample"
	install -vDm744 -t "$pkgdir/usr/share/doc/ftpsync/" "distrib/etc/runmirrors.conf.sample"
	install -vDm744 -t "$pkgdir/usr/share/doc/ftpsync/" "distrib/etc/runmirrors.mirror.sample"
	install -vDm744 -t "$pkgdir/usr/share/man/man1/" "distrib/doc/ftpsync.1"
	install -vDm744 -t "$pkgdir/usr/share/man/man5/" "distrib/doc/ftpsync.conf.5"
	install -vDm744 -t "$pkgdir/usr/share/man/man1/" "distrib/doc/ftpsync-cron.1"
	install -vDm744 -t "$pkgdir/usr/share/man/man1/" "distrib/doc/rsync-ssl-tunnel.1"
	install -vDm744 -t "$pkgdir/usr/share/man/man1/" "distrib/doc/runmirrors.1"
	install -vDm744 -t "$pkgdir/usr/share/man/man5/" "distrib/doc/runmirrors.conf.5"
	install -vDm744 -t "$pkgdir/usr/share/man/man5/" "distrib/doc/runmirrors.mirror.5"

}
