# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Jan Fader <jan.fader@web.de>
# Contributor: Stephen Drodge <stephen.drodge@gmail.com>
# Maintainer: SanskritFritz (gmail)

pkgname=fish-git
_gitname="fish-shell"
pkgver=3.0.0.r164.g455959ae
pkgrel=1
epoch=2
pkgdesc="User friendly shell intended mostly for interactive use."
arch=('i686' 'x86_64' 'arm')
url="http://fishshell.com"
license=("GPL2")
depends=('ncurses')
optdepends=('python: fish_update_completions and other tools' 
			'xsel: clipboard integration')
makedepends=('doxygen' 'git' 'ncurses')
provides=('fish' 'fish-shell')
conflicts=('fish' 'fish-shell')
install='fish.install'
source=("git://github.com/fish-shell/fish-shell.git")
md5sums=('SKIP')

pkgver() {
	cd "$_gitname"
#	git log -1 --format="%cd" --date=short | sed 's|-|.|g'
	git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_gitname"

	autoreconf --no-recursive
	./configure --prefix=/usr --sysconfdir=/etc --docdir=/usr/share/doc/fish --without-included-pcre2
	make
}

package() {
	cd "$srcdir/$_gitname"
	make DESTDIR="$pkgdir" install
}
