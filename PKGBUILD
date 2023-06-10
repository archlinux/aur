# Maintainer: Nathan Wong, NorthWestWind <wsyn148@gmail.com>
_pkgname=presence-client
pkgname=$_pkgname-git
pkgver=1.0.1.r22.g5184927
pkgrel=1
pkgdesc="Rich presence support for hacked Nintendo Switches with automatic game detection. Using the elsorino fork."
arch=('any')
url="https://github.com/elsorino/PresenceClient"
license=('GPL2')
depends=('python' 'python-pypresence')
source=("${_pkgname}::git+https://github.com/elsorino/PresenceClient.git" "executable.patch")
md5sums=('SKIP' '864fa26af5c1c74fd46f4be40951aac9')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"
  patch --forward --strip=1 --input="${srcdir}/executable.patch"
}

package() {
	install -Dm755 $srcdir/$_pkgname/presence-client.py $pkgdir/usr/bin/presence-client
}
