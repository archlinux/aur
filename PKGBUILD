# Maintainer: ian <ian at kremlin dot cc>
pkgname=bashstyle-git
pkgver=0.10.7.2.r4.g79693f4
pkgrel=1
pkgdesc="A PyGTK client for managing bash, readline, vim, and nano settings (git version)"
arch=('any')
url="https://github.com/Nanolx/bashstyle-ng"
license=('GPL3')
groups=('system')
depends=('python' 'dmidecode' 'gawk' 'sed' 'bc' 'gettext' 'less' 'libnewt' 'python-configobj' 'python-gobject')
makedepends=('git')
optdepends=("acpi: showbatteryload support" "tree: fs support")
conflicts=('bashstyle')
provides=('bashstyle')
source=('git+https://github.com/Nanolx/bashstyle-ng.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/bashstyle-ng"
	 git describe --long | sed 's/^bashstyleng-/0./;s/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
	cd "$srcdir/bashstyle-ng"
	./configure --python=/usr/bin/python --no-postinstall
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
