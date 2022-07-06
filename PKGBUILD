# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Maintainer:  SanskritFritz (gmail)

_name=kupfer
pkgname=$_name-git
pkgver=v321.r9.g35759097
pkgrel=1
pkgdesc="An interface for quick and convenient access to applications and their documents."
arch=(any)
url="https://kupferlauncher.github.io/"
license=('GPL3')
depends=('libkeybinder3' 'python-dbus' 'python-cairo' 'libwnck3' 'python-pyxdg' 'python-gobject')
makedepends=('intltool' 'itstool' 'python-docutils' 'git')
optdepends=('xautomation: Send Keys plugin'
            'gvfs: Trash plugin')
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
