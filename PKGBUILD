# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Maintainer:  SanskritFritz (gmail)

_name=kupfer
pkgname=$_name-git
pkgver=v301.r2.g2bae3642
pkgrel=1
pkgdesc="An interface for quick and convenient access to applications and their documents."
arch=(any)
url="https://kupferlauncher.github.io/"
license=('GPL')
depends=('libkeybinder3' 'python-dbus' 'python' 'python-cairo' 'libwnck3')
makedepends=('python2' 'intltool')
optdepends=('gnome-python-desktop: enables all plugins and gnome integration'
            'xautomation: enables the Send Keys plugin')
makedepends=('python2' 'intltool' 'git')
provides=("$_name")
conflicts=("$_name")
source=("git+https://github.com/kupferlauncher/kupfer.git")
md5sums=('SKIP')

pkgver() {
	cd "$_name"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_name"

	# fix man page generation
	sed -i 's_rst2man_&2_Ig' wscript

	export PYTHON=/usr/bin/python

	python2 waf configure --prefix=/usr --no-update-mime --no-update-icon-cache
	python2 waf
} 

package() {
	cd "$srcdir/$_name"
	python2 waf install -f --destdir="$pkgdir/"
}
