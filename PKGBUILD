
# Maintaner: Dummerle
pkgname=rare
pkgver=1.8.4
pkgrel=1
pkgdesc="A GUI for legendary, an open source replacement for Epic Games Launcher"
arch=('any')
url="https://github.com/Dummerle/Rare"
license=('GPL3')
groups=()
depends=("python-pyqt5" "python-qtawesome" "python-requests" "python-psutil")
makedepends=("git" "python-setuptools")
checkdepends=()
optdepends=("wine-staging: Run windows games" "python-pypresence: Use Discord RPC ")
provides=()
conflicts=("rare-git")
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver::git+$url#tag=$pkgver")
noextract=()
sha256sums=("SKIP")

prepare() {
      cd $srcdir/$pkgname-$pkgver
      git submodule init
      git submodule update
      cd "$srcdir/$pkgname-$pkgver"
      cp $srcdir/$pkgname-$pkgver/rare/resources/images/Rare.png $srcdir/$pkgname-$pkgver/$pkgname.png
      sed -i 's/mdi.view-grid-outline/mdi.view-grid/' $srcdir/$pkgname-$pkgver/rare/utils/extra_widgets.py
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python3 setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 "misc/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "${pkgname}.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}


