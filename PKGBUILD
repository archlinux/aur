# Maintainer: Sherlock HOlo <sherlockya(at)gmail.com>

pkgname=system-storage-manager
pkgver=0.5
pkgrel=2
pkgdesc='A single tool to manage your storage'
arch=('i686' 'x86_64')
url='https://github.com/system-storage-manager/ssm'
license=('GPL2')
depends=('python' 'btrfs-progs' 'dmraid')
makedepends=('python-sphinx')
source=("$url/archive/system-storage-manager-0.5.tar.gz")
sha256sums=('04ae88f42967a45fb832d8528a2f688f40e4593c11efd5111cb515da842874e2')

prepare() {
	cd $srcdir/ssm-$pkgname-$pkgver/doc
	make man
	#sed -i 's/data_files/#data_files/g' setup.py
	#sed -i "s/ ('/#('/g" setup.py
	#sed -i "s/\['R/#\['R/g" setup.py
    cd ..
	python setup.py build
}

package() {
    cd $srcdir/ssm-$pkgname-$pkgver
    python setup.py install --skip-build --prefix="/usr" --root="$pkgdir" --optimize=1
}
