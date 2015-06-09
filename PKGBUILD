# Contributor: Devaev Maxim <mdevaev@gmail.com>
# Author: Devaev Maxim <mdevaev@gmail.com>


pkgname="emonoda"
pkgver="1.9.13"
pkgrel="1"
pkgdesc="A set of tools to organize and manage your torrents"
arch=("any")
url="https://github.com/mdevaev/emonoda"
license="GPL"
depends=(
	"python"
	"python-chardet"
	"python-pyyaml"
	"python-colorama"
	"python-pygments"
	"python-pytz"
	"python-dateutil"
)
optdepends=(
	"python-transmissionrpc: Transmission support"
	"python-dbus: KTorrent support"
)
makedepends=("python-setuptools" "wget")


build() {
	cd $startdir/src
	if [ ! -d $pkgname-$pkgver ]; then
		msg "Downloading tag v$pkgver..."
		wget $url/archive/v$pkgver.tar.gz
		tar -xzf v$pkgver.tar.gz
	fi

	rm -rf $pkgname-build
	cp -r $pkgname-$pkgver $pkgname-build
	cd $pkgname-build

	python setup.py build
}

package() {
	cd $srcdir/emonoda-$pkgver
	python setup.py install --root=$pkgdir
}
