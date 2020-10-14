# Maintainer: gardar <aur@gardar.net>

_pkgname=cc2538-bsl
pkgname=python-$_pkgname
pkgver=2.1.r43.g11de8cb
pkgrel=1
pkgdesc="Script to communicate with Texas Instruments CC13xx/CC2538/CC26xx Serial Boot Loader."
arch=('any')
url="https://github.com/JelmerT/$_pkgname"
license=('BSD')
depends=('python-pyserial')
makedepends=('python-setuptools-scm' 'git' 'ruby-ronn')
optdepends=('python-magic' 'python-intelhex')
source=("git+git://github.com/JelmerT/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"
	ronn -r --manual=$pkgname README.md
	sed -n '/Copyright/,/ DAMAGE./p' $_pkgname.py > LICENSE
}
package() {
	cd "$_pkgname"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm 644 README "$pkgdir/usr/share/man/man1/$pkgname.1"
	python setup.py install --optimize=1 --root="$pkgdir"
}
