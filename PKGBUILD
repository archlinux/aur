# Maintainer: biloucat <biloucat at gmail dot com>

pkgname=python-tkencfs-git
_gitname=tkencfs
pkgver=0.9.r8.g081e649
pkgrel=1
pkgdesc='EncFS GUI for encrypted directory mounting'
arch=('any')
url='https://github.com/biloucat/tkencfs'
license=('GPL3')
makedepends=('git' 'python-setuptools')
depends=('encfs' 'python>=3.6' 'tk>=8.6.6')

source=("git+https://github.com/biloucat/tkencfs.git")
md5sums=('SKIP')


pkgver() {
  cd "$srcdir/$_gitname"
	#cutting off 'v' prefix that presents in the git un-annoted tag
	git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}
package() {
  cd "$srcdir/$_gitname"
  python setup.py install --root="$pkgdir/" --optimize=1
	# remove egg
	msg "Remove egg"
	rm  -R $pkgdir/usr/lib
}
