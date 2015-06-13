# Contributor: wido <widomaker2k7@gmail.com>
# Contributor: SakalisC <chrissakalis (gmail)>
# Maintainer: SanskritFritz (gmail)

pkgname=logkeys-git
_gitname="logkeys"
pkgver=2012.02.06
pkgrel=4
pkgdesc="Simple keylogger supporting also USB keyboards."
license=('GPLv3')
arch=('i686' 'x86_64')
optdepends=('logkeys-keymaps-git: for additional keymaps')
makedepends=('git')
conflicts=('logkeys')
provides=('logkeys')
url="http://logkeys.googlecode.com/"
install=logkeys.install
backup=('etc/conf.d/logkeysd')
source=("logkeysd.conf" "logkeys.service"
        "$_gitname::git+http://logkeys.googlecode.com/git/")

md5sums=('c05608a47e303e8f604f46d1ed22aa4a'
         'bd70a5e5601168bbf7bf7f91ee530d14'
         'SKIP')

pkgver() {
        cd "$_gitname"
        git log -1 --format="%cd" --date=short | sed 's|-|.|g'
}

build() {
	cd "$srcdir/$_gitname"
	./configure --prefix=/usr --sysconfdir=/etc
	make
}

package() {
	cd "$srcdir/$_gitname"
	make prefix="$pkgdir/usr" sysconfdir="$pkgdir/etc" install

	install -Dm0644 "$srcdir/logkeysd.conf" "$pkgdir/etc/conf.d/logkeysd"
	install -Dm0644 "$srcdir/logkeys.service" "$pkgdir/usr/lib/systemd/system/logkeys.service"
}
