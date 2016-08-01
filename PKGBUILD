# Maintainer: zaps166 <spaz16@wp.pl>

pkgname=kiiro-notes-git
pkgver=0.0.1
pkgrel=1
pkgdesc='Simple notes for Linux desktop'
arch=('i686' 'x86_64' 'armv7' 'armv6' 'armv5')
url='https://github.com/zaps166/KiiroNotes'
license=('GPL')
depends=('qt5-base')
makedepends=('make' 'gcc' 'git' 'qt5-tools')
source=('git+https://github.com/zaps166/KiiroNotes')
sha256sums=('SKIP')

pkgver()
{
	grep "setApplicationVersion" "$srcdir"/KiiroNotes/src/main.cpp | cut -c33-37
}

build()
{
	cd "$srcdir"/KiiroNotes/src
	lrelease-qt5 KiiroNotes.pro
	qmake-qt5
	time make
}

package()
{
	install -D -m 755 "$srcdir"/KiiroNotes/src/KiiroNotes "$pkgdir"/usr/bin/KiiroNotes
	cp -r "$srcdir"/KiiroNotes/share "$pkgdir"/usr
}
