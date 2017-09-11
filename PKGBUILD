# Maintainer: rohannb <rohannb30@gmail.com>
pkgname='liclipse'
pkgver=4.1.1
pkgrel=2
pkgdesc='Lightweight editors, theming and usability improvements for Eclipse'
arch=('i686' 'x86_64')
url='https://www.liclipse.com/index.html'
license=('custom')
makedepends=('gendesk' 'imagemagick')
optdepends=('coffee-script: CoffeeScript support'
            'cmake: CMake support'
	    'dart: Dart support'
	    'python-django: Django Templates support (Python 3)'
	    'python2-django: Django Templates support (Python 2)'
	    'go: Go support'
	    'java-environment-common: Java support'
	    'python-jinja: Jinja2 support (Python 3)'
	    'python2-jinja: Jinja2 support (Python 2)'
	    'julia: Julia support'
	    'python-kivy: Kivy Language support (Python 3)'
	    'python2-kivy: Kivy Language support (Python 2)'
	    'python-mako: Mako Templates support (Python 3)'
	    'python2-mako: Mako Templates support (Python 2)'
	    'nim: Nim support'
	    'perl: PERL support'
	    'python: Python 3 support'
	    'python2: Python 2 support'
	    'ruby: Ruby support')
changelog='changelog'
source_i686=('http://www.mediafire.com/file/91dktuh6aq17uhd/liclipse_4.1.1_linux.gtk.x86.tar.gz')
source_x86_64=('http://www.mediafire.com/file/rwc4bk3nthtxcvv/liclipse_4.1.1_linux.gtk.x86_64.tar.gz')
sha256sums_i686=('42727b12a947b9be1317579af348ddc92f7822e7f4c6e67d51c25d68ddb889d1')
sha256sums_x86_64=('e45083e628b789bd1789eec291525fd56e2c9b105f64cf9defb2a60d09d21988')

# gendesk variables for .desktop file
_name='LiClipse'
_genericname='Integrated Development Environment'
_comment='Lightweight editors, theming and usability improvements for Eclipse'
_exec='/opt/liclipse/LiClipse'
_categories='Development;IDE;Java'

prepare() {
	gendesk -f -n
}

package() {
	mkdir -p "$pkgdir/opt/$pkgname"
	cp -r "$srcdir/$pkgname" "$pkgdir/opt"
	
	mkdir -p "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/LiClipse" "$pkgdir/usr/bin/liclipse"
	
	install -Dm644 "$srcdir/$pkgname/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.TXT"
	
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	convert "$srcdir/$pkgname/icon.xpm" "$pkgname.png"
	install -Dm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

