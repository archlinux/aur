# Maintainer: Eric Brandwein <brandweineric at gmail dot com>
pkgname=process-watcher-git
pkgver=r25.5d2037d
pkgrel=1
pkgdesc="Watch Linux processes and notify when they complete."
arch=(any)
url="https://github.com/arlowhite/process-watcher"
license=('MIT')
groups=()
depends=('python' 'python-dbus')
makedepends=('git')
optdepends=('python-notify2: desktop notifications support')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/arlowhite/process-watcher.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	# There's probably a better installation directory than
	# /opt, and probably a better way of copying all files;
	# if someone knows and wants to help, email me.
	cd "$srcdir/${pkgname%-git}"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
	mkdir $pkgdir/opt/
	cp -r $srcdir/${pkgname%-git}/ "$pkgdir/opt/${pkgname%-git}"
	mkdir $pkgdir/usr/bin
	ln -s $pkgdir/opt/${pkgname%-git}/process_watcher.py $pkgdir/usr/bin/process_watcher
	chmod +x $pkgdir/usr/bin/process_watcher
}
