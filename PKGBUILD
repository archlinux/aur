# Maintainer: ian <ian at kremlin dot cc>
pkgname=bashstyle-git
pkgver=bashstyleng.9.1.r86.g8fecd78
pkgrel=1
pkgdesc="A PyGTK client for managing bash, readline, vim, and nano settings (git version)"
arch=('any')
url="https://github.com/Nanolx/bashstyle-ng"
license=('GPL3')
groups=('system')
depends=('python2' 'dmidecode' 'gawk' 'sed' 'bc' 'gettext' 'less' 'libnewt' 'python2-configobj' 'python2-gobject' 'hicolor-icon-theme')
makedepends=('git')
optdepends=("acpi: showbatteryload support" "tree: fs support")
install="bashstyle-git.install"
conflicts=('bashstyle')
provides=('bashstyle')
source=("git://github.com/Nanolx/bashstyle-ng.git" "bashstyle-git.install")
md5sums=('SKIP'
         '7035b66999f96ea0030d7af7ce14c25a')

pkgver() {
	cd "$srcdir/bashstyle-ng"
	git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}
build() {
	cd "$srcdir/bashstyle-ng"
	./configure --python=/usr/bin/python2 --no-postinstall
	./make build
}

package() {
	cd "$srcdir/bashstyle-ng"
mkdir -p $pkgdir/usr/share/doc/bashstyle-ng
	DESTDIR="$pkgdir/" ./make install

	# get rid of locales if already present
	#if [ -f /usr/share/locale/de/LC_MESSAGES/bs-ng-wizard.mo ]; then
	#	rm $pkgdir/usr/share/locale/de/LC_MESSAGES/bs-ng-wizard.mo
	#fi
	if [ -f /usr/share/locale/de/LC_MESSAGES/bs-ng.mo ]; then
		rm $pkgdir/usr/share/locale/de/LC_MESSAGES/bs-ng.mo
	fi
	if [ -f /usr/share/locale/de/LC_MESSAGES/nx-rc.mo ]; then
		rm $pkgdir/usr/share/locale/de/LC_MESSAGES/nx-rc.mo
	fi
	if [ -f /usr/share/locale/es/LC_MESSAGES/bs-ng.mo ]; then
		rm $pkgdir/usr/share/locale/es/LC_MESSAGES/bs-ng.mo
	fi
	if [ -f /usr/share/locale/es/LC_MESSAGES/nx-rc.mo ]; then
		rm $pkgdir/usr/share/locale/es/LC_MESSAGES/nx-rc.mo
	fi
	if [ -f /usr/share/locale/it/LC_MESSAGES/bs-ng.mo ]; then
		rm $pkgdir/usr/share/locale/it/LC_MESSAGES/bs-ng.mo
	fi
	#if [ -f /usr/share/locale/ru/LC_MESSAGES/bs-ng-wizard.mo ]; then
		#rm $pkgdir/usr/share/locale/ru/LC_MESSAGES/bs-ng-wizard.mo
	#fi
	#if [ -f /usr/share/locale/ru/LC_MESSAGES/bs-ng.mo ]; then
		#rm $pkgdir/usr/share/locale/ru/LC_MESSAGES/bs-ng.mo
	#fi
	#if [ -f /usr/share/locale/ru/LC_MESSAGES/nx-rc.mo ]; then
		#rm $pkgdir/usr/share/locale/ru/LC_MESSAGES/nx-rc.mo
	#fi

}
