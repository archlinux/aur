# Contributor: ReNoM <renom@list.ru>
pkgname=xpoty-hg
pkgver=1
pkgrel=1
pkgdesc="Xpoty is an attempt to demonstrate how to write XMPP gateways to other IM networks."
arch=(i686 x86_64)
url="https://bitbucket.org/dion/xpoty2xmpp"
license="MIT"
depends=('python2-distribute' 'python2-pyxmpp')
makedepends=('mercurial')
source=()
md5sums=()

build() {
	cd $srcdir
	if [ -d xpoty2xmpp ] ; then
		cd xpoty2xmpp
		hg pull -u || return 1
	else
		hg clone https://bitbucket.org/dion/xpoty2xmpp || return 1
	fi
}

package() {
	cd $srcdir/xpoty2xmpp
	python2 setup.py install --root=$startdir/pkg --optimize=1
	mkdir -p $startdir/pkg/etc/xpoty2xmpp/
	cp xpoty.cfg.template $startdir/pkg/etc/xpoty2xmpp/
}

