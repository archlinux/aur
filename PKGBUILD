# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Maintainer:  SanskritFritz (gmail)

_name=kupfer
pkgname=$_name-git
pkgver=v309.r1.gec2a47e0
pkgrel=1
pkgdesc="An interface for quick and convenient access to applications and their documents."
arch=(any)
url="https://kupferlauncher.github.io/"
license=('GPL')
depends=('libkeybinder3' 'python-dbus' 'python-cairo' 'libwnck3' 'python-xdg' 'python-gobject')
makedepends=('intltool')
optdepends=('gnome-python-desktop: enables all plugins and gnome integration'
            'xautomation: enables the Send Keys plugin')
makedepends=('intltool' 'git')
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

	python waf configure --prefix=/usr --no-update-mime --no-update-icon-cache
	python waf
} 

package() {
	cd "$srcdir/$_name"
	python waf install -f --destdir="$pkgdir/"
}
