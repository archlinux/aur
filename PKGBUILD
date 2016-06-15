# Contributor: Sergey Kolesov <cucullus.at.mail.ru>
# Previously contributed by StormBlast and Vyazovoi

pkgname=xneur
pkgver=0.18.0
pkgrel=2
pkgdesc='X Neural Switcher detects the language of input and corrects keyboard layout if needed'
url="http://www.xneur.ru"
arch=('i686' 'x86_64')
license=('GPL')
depends=("gstreamer>=1.2.4" 'enchant' 'libnotify' 'gtk2')
source=("https://raw.githubusercontent.com/AndrewCrewKuznetsov/xneur-devel/master/Launchpad/xneur_$pkgver+git27.orig.tar.gz")
optdepends=('hunspell-<your_lang>: Dramatically improves heuristics quality')
md5sums=('2850e1c66e8eba69e5a15bb952cc4b76')

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
