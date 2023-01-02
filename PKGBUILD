# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Sauliusl <luksaulius[at]gmail[dot]com>

pkgname=beads
pkgver=1.1
pkgrel=3
pkgdesc="Bias Elimination Algorithm for Deep Sequencing."
url="https://beads.sourceforge.net/"
arch=('any')
license=('unknown')
depends=('python2' 'java-environment')
install=beads.install
source=("$pkgname-$pkgver.tar.gz::https://downloads.sourceforge.net/project/beads/BEADS-${pkgver}.tar.gz"
        "beads.sh")
sha256sums=('108d2f7cd84da9c6923c7b39d6496b5c1b06fe66bfa9989e8e18f0cd511db6f1'
            '0be9c6938aebc5f0f68d453e241865c0c0c06af405dbac8c11993e37eda87a9c')

prepare() {
	cd "BEADS-$pkgver"
	mv Scripts/beads Scripts/beads.py
	sed -i 's/Scripts\/beads/Scripts\/beads.py/' setup.py
}

build() {
	cd "BEADS-$pkgver"
	python2 setup.py build
}

package() {
	cd "BEADS-$pkgver"
	python2 setup.py install --root="$pkgdir" --optimize=1
	install -Dv "$srcdir/beads.sh" "$pkgdir/usr/bin/beads"
	install -Dvm644 BEADSjava.jar -t "$pkgdir/usr/share/java/$pkgname/"
}
