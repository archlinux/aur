# Contributor: SpepS <dreamspepser at yahoo dot it>
# Maintainer: SanskritFritz (gmail)

_name=kupfer
pkgname=${_name}-adds-git
_gitname=$_name-adds
pkgver=2013.10.26
pkgrel=4
epoch=1
pkgdesc="An interface for quick and convenient access to applications and their documents. Forked by Karol Bedkowski."
arch=(any)
url="https://github.com/KarolBedkowski/kupfer-adds"
license=('GPL')
depends=('python2-xdg' 'pygtk' 'python2-dbus' 'python2-gconf' 'python2-keybinder2'
         'hicolor-icon-theme' 'desktop-file-utils')
optdepends=('gnome-python-desktop: enables all plugins and gnome integration'
            'python2-keyring: gnome keyring integration'
            'python2-wnck: tracks running applications'
            'python2-setproctitle: set process name'
            'python-gdata: google services'
            'xautomation: enables the Send Keys plugin')
makedepends=('git' 'gnome-doc-utils' 'docutils' 'intltool')
provides=("$_name")
conflicts=("$_name")
install="$pkgname.install"
source=("$_gitname::git://github.com/KarolBedkowski/kupfer-adds.git")
md5sums=('SKIP')

pkgver() {
	cd "$_gitname"
	git log -1 --format="%cd" --date=short | sed 's|-|.|g'
}

build() {
	cd "$srcdir/$_gitname"
	# python2 fixes
	export PYTHON=/usr/bin/python2

	python2 waf configure --prefix=/usr --no-update-mime --no-update-icon-cache
	python2 waf
} 

package() {
  cd "$srcdir/$_gitname"
  python2 waf install -f --destdir="$pkgdir/"
}
