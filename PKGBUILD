# Maintainer: Aaron Lindsay <aaron@aclindsay.com>

pkgname=go-asink-git
pkgver=0.1
pkgrel=7
pkgdesc="An open source Dropbox clone"
arch=('x86_64' 'i686' 'armv7h')
url="https://github.com/aclindsa/asink"
license=('GPL')
makedepends=('go' 'git' 'mercurial' 'sqlite')
options=('!strip' '!emptydirs')
source=("tmpfiles_asink.conf")
sha256sums=('a3ffee66244aaf41546f98f090990dbe2d4fce1bbd15f8721035484313b9d073')
_gourl=github.com/aclindsa/asink

build() {
	mkdir -p $srcdir/tmp
	TMPDIR="$srcdir/tmp" GOPATH="$srcdir" go get -fix -v -x ${_gourl}/asink
	TMPDIR="$srcdir/tmp" GOPATH="$srcdir" go get -fix -v -x ${_gourl}/asinkd
}

package() {
	install -Dm644 tmpfiles_asink.conf "$pkgdir/usr/lib/tmpfiles.d/asink.conf"

	cd $srcdir/bin
	install -Dm755 asink "$pkgdir/usr/bin/asink"
	install -Dm755 asinkd "$pkgdir/usr/bin/asinkd"

	cd $srcdir/src/${_gourl}
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 example_config "$pkgdir/etc/asink/example_config"
}
