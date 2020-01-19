# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
pkgname='cloudprint-cups'
pkgver='20170402'
_commit='1f279036fad249efa8a2bca7f8f54adffd3b59c8'
pkgrel='2'
epoch='1'
pkgdesc='Google Cloud Print driver for CUPS, allows printing to printers hosted on GCP'
arch=('any')
url='https://github.com/simoncadman/CUPS-Cloud-Print'
license=('GPL3')
depends=('cups' 'ghostscript' 'imagemagick' 'python2' 'python2-httplib2' 'python2-pycups' 'python2-pyopenssl' 'python2-six' 'tk')
install="$pkgname.install"
source=("$pkgname-$epoch:$pkgver-$pkgrel.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('9dcc50c453fd3819dedbdcbb7c7be9ca7adc1c3ad79f7d4ac12248eed2cf0448')

_sourcedirectory="CUPS-Cloud-Print-$_commit"

build() {
	cd "$srcdir/$_sourcedirectory/"
	./configure --prefix '/usr'
	make
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	NOPERMS=1 make DESTDIR="$pkgdir" INSTALL='install -p' install
	python2 -O -m compileall "$pkgdir/usr/share/$pkgname"

	install -dm755 "$pkgdir/usr/bin"
	ln -sf "/usr/share/$pkgname/setupcloudprint.py" "$pkgdir/usr/bin/setupcloudprint"
}
