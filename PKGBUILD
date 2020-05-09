# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: hellwoofa (at arcor dot de)
pkgname=xbindkeys_config-gtk2
_pkgname=xbindkeys_config
pkgver=0.1.3
_pkgver=2.1
pkgrel=1
pkgdesc="XBindKeys_Config is an easy to use gtk program for configuring \
	Xbindkeys. GTK2 version. "
arch=(i686 x86_64)
url="http://hocwp.free.fr/xbindkeys/xbindkeys.html"
license=('GPL')
depends=('xbindkeys' 'gtk2')
conflicts=('xbindkeys_config')
source=(http://ftp.de.debian.org/debian/pool/main/x/xbindkeys-config/xbindkeys-config_${pkgver}.orig.tar.gz \
        http://ftp.de.debian.org/debian/pool/main/x/xbindkeys-config/xbindkeys-config_${pkgver}-${_pkgver}.diff.gz)
sha512sums=('95621b4f4cac14c922caa51d15376a7f5223d1e0742efb994d2e1f8ffcf16645bc118ac835ff70be64810309363404b23b9540dee1e0f2a6ba86a5e500230f10'
            '60e53369120af0838ceb47658063e34634d041a635724c2e80bc40f6a45a159c5bfc7891641ddd66e3d7e24228757d9b38da6501975a46fe057e53578b5531a6')

build() {
	gzip -d ../xbindkeys-config_${pkgver}-${_pkgver}.diff.gz
	cd "$srcdir/$_pkgname-$pkgver"
	patch -p1 <../xbindkeys-config_${pkgver}-${_pkgver}.diff
	make
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	mkdir -p $pkgdir/usr/bin
	make DESTDIR="$pkgdir" install
}
