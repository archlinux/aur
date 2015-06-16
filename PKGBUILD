#Contributor: LinkMaster03 linkmaster032000 at gmail dot com
#Fixed by Cravix ( dr dot neemous at gmail dot com )
pkgname=supybot-git
_pkgname=supybot
pkgver=0.83.4.1.7089.6f925e5
pkgrel=1
pkgdesc="A cross-platform IRC bot written in Python"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/supybot/"
license=('3-clause BSD')
depends=('python2>=2.5' 'python2-pysqlite-legacy' 'python2-twisted')
optdepends=('python2-pyopenssl: SSL server support')
conflicts=('supybot')
provides=('supybot')
makedepends=('git')
source=("git://$_pkgname.git.sourceforge.net/gitroot/$_pkgname/$_pkgname")
md5sums=('SKIP')
pkgver() {
	cd "$srcdir/$_pkgname"
	echo $(awk -F"['+]" '/version/ {print $2} ' src/version.py).$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
build() {
  cd "$srcdir/$_pkgname"
	
  python2 setup.py build
}

package() {
	cd "$srcdir/$_pkgname"
  python2 setup.py install --root="$pkgdir"
  mkdir -p "$pkgdir/usr/share/licenses/$_pkgname/"
  install -m644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/" || return 1
}
