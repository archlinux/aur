# Maintainer: Anton Leontiev <bunder /at/ t-25.ru>
_pkgname=scout
pkgname=$_pkgname-git
pkgver=20110426.158
pkgrel=2
pkgdesc='A CLI interface to Tomboy and Gnote'
arch=('any')
url='https://github.com/lelutin/scout'
license=('BSD')
depends=('python2' 'python2-dbus')
makedepends=('git' 'python2-distribute' 'haskell-pandoc')
optdepends=('tomboy: either this one' 'gnote: or that one must be installed')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+git://github.com/lelutin/scout.git" 'scout-man.patch')
md5sums=('SKIP'
	'67bb8bbfb7370496644c737638566207')

pkgver() {
	cd "$_pkgname"
	echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
}

prepare() {
	cd "$_pkgname"
	patch -i "$srcdir/scout-man.patch"
}

package() {
	cd "$_pkgname"
	python2 ./setup.py install --root "$pkgdir"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
