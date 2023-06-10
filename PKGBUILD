# Maintainer: Nathan Wong, NorthWestWind <wsyn148@gmail.com>
_pkgname=presence-client
pkgname=$_pkgname-git
pkgver=1.0.1.r16.g1b8fb5d
pkgrel=1
pkgdesc="Rich presence support for hacked Nintendo Switches with automatic game detection."
arch=('any')
url="https://github.com/SunResearchInstitute/PresenceClient"
license=('GPL2')
depends=('python' 'python-pypresence')
source=("${_pkgname}::git+https://github.com/SunResearchInstitute/PresenceClient.git" "executable.patch")
md5sums=('SKIP' '9f63f7e40df1e505e66033ace946e81f')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"
  patch --forward --strip=1 --input="${srcdir}/executable.patch"
}

package() {
	install -Dm755 $srcdir/$_pkgname/PresenceClient/PresenceClient-Py/presence-client.py $pkgdir/usr/bin/presence-client
}
