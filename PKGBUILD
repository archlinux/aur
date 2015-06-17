# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Contributor: Daniele Paolella <danielepaolella@email.it>
# Contributor: Dieter P
pkgname=dvcs-autosync-git
pkgver=0.5.192.4bea986
pkgrel=1
pkgdesc="A personal Dropbox replacement based on Git"
arch=('any')
url="http://mayrhofer.eu.org/dvcs-autosync"
license=('GPL')
depends=('python2-pyinotify' 'xmpppy' 'python2')
makedepends=('git')
changelog=$pkgname.changelog
source=('git://gitorious.org/dvcs-autosync/dvcs-autosync.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/dvcs-autosync"
	git checkout master 2> /dev/null
	echo 0.5.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
	cd "$srcdir/dvcs-autosync"
	git checkout master
	python2 setup.py install --root="$pkgdir" --optimize=1
}
