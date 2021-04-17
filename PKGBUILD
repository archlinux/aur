
# Maintaner: Dummerle
pkgname=rare
pkgver=1.2.0
pkgrel=1
pkgdesc="A GUI for legendary, an open source replacement for Epic Games Launcher"
arch=('any')
url="https://github.com/Dummerle/Rare"
license=('GPL3')
groups=()
depends=("python-wheel" "python-setuptools" "python-pyqt5" "python-qtawesome" "python-requests" "python-pillow" "python-psutil" "python-pypresence")
makedepends=("git" "python-setuptools" "gendesk")
checkdepends=()
optdepends=("wine-staging: Run windows games")
provides=()
conflicts=()
eplaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
noextract=()
sha256sums=("SKIP")

prepare() {
      cd "$srcdir/Rare-$pkgver"
      cp $srcdir/Rare-$pkgver/rare/styles/Logo.png $srcdir/Rare-$pkgver/$pkgname.png
      sed -i 's/mdi.view-grid-outline/mdi.view-grid/' $srcdir/Rare-$pkgver/rare/utils/extra_widgets.py
      gendesk -f -n \
        --pkgname "$pkgname" \
        --pkgdesc "$pkgdesc" \
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
	install -Dm644 "${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "${pkgname}.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}


