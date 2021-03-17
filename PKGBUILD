
# Maintaner: Dummerle
pkgname=rare
pkgver=0.9.4
pkgrel=1
pkgdesc="A GUI for legendary, an open source replacement for Epic Games Launcher"
arch=('any')
url="https://github.com/Dummerle/Rare"
license=('GPL3')
groups=()
depends=("python-wheel" "python-setuptools" "python-pyqt5" "python-qtawesome" "python-requests" "python-pillow")
makedepends=("git" "python-setuptools" "gendesk")
checkdepends=()
optdepends=("wine-staging: Run windows games")
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
noextract=()
sha256sums=("SKIP")

prepare() {
      cd "$srcdir/Rare-$pkgver"
      sed -i 's/mdi.view-grid-outline/mdi.view-grid/' $srcdir/Rare-$pkgver/Rare/utils/QtExtensions.py
      gendesk -n -f \
        --pkgname "Rare" \
        --pkgdesc "$pkgdesc" \
        --icon "$srcdir/Rare-$pkgver/Rare/Styles/Logo.png" \
        --categories "Application;Game;Launcher" \
        --custom "Keywords=epic;games;launcher;legendary;"
}

build() {
	cd "$srcdir/Rare-$pkgver"
	python3 setup.py build
}

package() {
	cd "$srcdir/Rare-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}


