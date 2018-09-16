# Maintainer: Sherlock Holo <sherlockya(at)gmail.com>

pkgname=system-storage-manager
_pkgver=1.2
pkgver=v$_pkgver
pkgrel=1
pkgdesc='A single tool to manage your storage'
arch=('i686' 'x86_64')
url='https://github.com/system-storage-manager/ssm'
license=('GPL2')
depends=('python2' 'btrfs-progs' 'dmraid' 'libpwquality')
makedepends=('python2-sphinx')
source=("$url/archive/system-storage-manager-$_pkgver.tar.gz")
sha256sums=('c84275228944bb5c669b1c6ab7525cca8345956bd66efd652d331b4cd20965bd')

prepare() {
    cd $srcdir/ssm-$pkgname-$_pkgver/bin
    sed 's/env python/env python2/g' ssm -i

	cd $srcdir/ssm-$pkgname-$_pkgver/doc
    sed 's/env python/env python2/g' generate_usage_includes.py -i
    sed 's/sphinx-build/sphinx-build2/g' Makefile -i
	make man
}

package() {
    cd $srcdir/ssm-$pkgname-$_pkgver
    python2 setup.py install --prefix="/usr" --root="$pkgdir" --optimize=1
}
