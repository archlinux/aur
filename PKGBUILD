# Contributor: SpepS <dreamspepser at yahoo dot it>
# Maintainer:  SanskritFritz (gmail)

_name=kupfer
pkgname=$_name-git
pkgver=2015.09.04
pkgrel=1
pkgdesc="An interface for quick and convenient access to applications and their documents."
arch=(any)
url="http://engla.github.io/kupfer/"
license=('GPL')
depends=('python2-xdg' 'pygtk' 'python2-dbus' 'python2-gconf' 'python2-keybinder2'
         'hicolor-icon-theme' 'desktop-file-utils')
optdepends=('gnome-python-desktop: enables all plugins and gnome integration'
            'python2-gnomekeyring: gnome keyring integration'
            'python2-wnck: tracks running applications'
            'python2-setproctitle: set process name'
            'python2-gdata: google services'
            'xautomation: enables the Send Keys plugin')
makedepends=('git' 'gnome-doc-utils' 'docutils' 'intltool')
provides=("$_name")
conflicts=("$_name")
install="$pkgname.install"
source=("git://git.gnome.org/$_name")
md5sums=('SKIP')

pkgver() {
	cd "$_name"
	git log -1 --format="%cd" --date=short | sed 's|-|.|g'
}

build() {
	cd "$srcdir/$_name"
	# python2 fixes
	export PYTHON=/usr/bin/python2

	python2 waf configure --prefix=/usr --no-update-mime --no-update-icon-cache
	python2 waf
} 

package() {
	cd "$srcdir/$_name"
	python2 waf install -f --destdir="$pkgdir/"
}
