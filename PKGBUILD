# Maintainer: Nils Czernia <nils[at]czserver[dot]de>
# Based on package aurbs from Dominik Heidler <dheidler@gmail.com>

pkgname=aurbs-git
_pkgname=aurbs
pkgver=1.3.2.r7.gd2cdcec
pkgrel=1
pkgdesc="AUR package build system"
arch=('any')
url="http://github.com/asdil12/aurbs"
license=('GPL')
conflicts=('aurbs')
install="aurbs.install"
depends=(
	'devtools' 'rsync' 'python'
	'python-setuptools' 'python-simplejson' 'python-yaml' 'python-pymongo' 'python-flask' 'pyalpm'
	'python-flup-hg'
)
backup=(
	'etc/aurbs.yml'
	'var/lib/aurbs/aurstaging/i686/aurstaging.db.tar.gz'
	'var/lib/aurbs/aurstaging/x86_64/aurstaging.db.tar.gz'
)

source=('git+https://github.com/asdil12/aurbs.git'
	'aurbs.install')
sha256sums=('SKIP'
            '3128b74b2b75488036af8db75bf0d93e106535a4a2dab7287d422ede83e71a14')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd $srcdir/$_pkgname
	make install DESTDIR=$pkgdir
}
