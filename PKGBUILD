# Maintainer: Ian D. Scott <ian@perebruin.com>
# Contributor: Kamil Stachowski <kamil.stachowski@gmail.com>

pkgname=git-ftp-git
_gitname=git-ftp
pkgver=0.8.0.r137.ga7ee732
pkgrel=1
pkgdesc="A shell script for pushing git tracked changed files to a remote host by FTP"
url='https://github.com/git-ftp/git-ftp'
arch=('i686' 'x86_64')
license=('GPL')
depends=('curl' 'git')
provides=('git-ftp-git')
conflicts=('git-ftp')
source=('git+git://github.com/git-ftp/git-ftp.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/$_gitname"
	make DESTDIR="$pkgdir" install
	install -D -m644 "$srcdir/$_gitname/AUTHORS" "$pkgdir/usr/share/$_gitname/AUTHORS"
	install -D -m644 "$srcdir/$_gitname/CHANGELOG.md" "$pkgdir/usr/share/$_gitname/CHANGELOG.md"
	install -D -m644 "$srcdir/$_gitname/INSTALL.md" "$pkgdir/usr/share/$_gitname/INSTALL.md"
	install -D -m644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/$_gitname/LICENSE"
	install -D -m644 "$srcdir/$_gitname/README.md" "$pkgdir/usr/share/$_gitname/README.md"
	install -D -m644 "$srcdir/$_gitname/man/git-ftp.1.md" "$pkgdir/usr/share/$_gitname/git-ftp.1.md"
	msg "\n\n"
	msg "WARNING: Man page installed in /usr/share/$_gitname as markdown."
	msg "You can convert it to the man format with \"make man\" (requires pandoc).\n\n"
}
