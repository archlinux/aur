# Contributor: Sergey Kolesov <cucullus.at.mail.ru>
# Previously contributed by StormBlast and Vyazovoi

pkgname=xneur
pkgver=0.19.0
pkgrel=1
pkgdesc='X Neural Switcher detects the language of input and corrects keyboard layout if needed'
url="http://www.xneur.ru"
arch=('i686' 'x86_64')
license=('GPL')
depends=("gstreamer>=1.2.4" 'enchant' 'libnotify' 'gtk2')
source=("https://raw.githubusercontent.com/AndrewCrewKuznetsov/xneur-devel/master/dists/$pkgver/xneur_$pkgver.orig.tar.gz")
optdepends=('hunspell-<your_lang>: Dramatically improves heuristics quality')
md5sums=('34087b0a2dde6bcd639236474c06467f')

build() {
    cd $srcdir/$pkgname-$pkgver

CPPFLAGS="-Wno-misleading-indentation -Wno-unused-variable" # For gcc6 compat
    ./configure --prefix=/usr --sysconfdir=/etc \
	--without-xosd \
	--with-gtk=gtk2 # Because gxneur still doesn't supports gtk3
    make
}

package() {
    cd $srcdir/$pkgname-$pkgver
    make DESTDIR=$pkgdir install
}
