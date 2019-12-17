# Maintainer: Radek Podgorny <radek@podgorny.cz>

pkgname=omgf
pkgver=2.2.0
pkgrel=1
pkgdesc="Use Git Flow with ease – maintain branches, semantic versioning, releases, and changelog with a single command."
arch=('any')
url='https://github.com/InternetGuru/omgf'
license=('GPL-3')
depends=('git')
source=("https://github.com/InternetGuru/omgf/archive/v${pkgver}.tar.gz")
md5sums=('9f1c891c448f97709b4223f740c642e0')

build() {
   cd "$srcdir/$pkgname-$pkgver"
   ./configure
   make prefix="$pkgdir/usr"
   # the prefix= doesn't seem to be working so fix it the hard way
   sed -i 's|OMGF_DATAPATH=.*|OMGF_DATAPATH=/usr/share/omgf|g' compiled/omgf
}

package() {
   cd "$srcdir/$pkgname-$pkgver"
   compiled/install
}
