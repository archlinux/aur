# Maintainer: Isaac Ruben <isaac at rubenfamily dot com>
pkgname='pathplanner-bin'
pkgver="v2023.4.2"
pkgrel=1
pkgdesc="A simple yet powerful motion profile generator for FRC robots"
arch=("x86_64")
url="https://github.com/mjansen4857/pathplanner"
license=('MIT')
provides=("pathplanner")
source=("$pkgname-$pkgver.zip::https://github.com/mjansen4857/pathplanner/releases/download/$pkgver/PathPlanner-linux.zip")
sha256sums=('024c794d663ec670e78b8c3b25e103e2508e539346fcf9b888e204717fd38625')

prepare() {
	{
		echo "[Desktop Entry]"
		echo "Version=1.5"
		echo "Type=Application"
		echo "Name=PathPlanner"
		echo "Exec=/usr/bin/pathplanner"
		echo "Categories=Development"
		echo "Keywords=FRC;Motion Profile;Path Planning"
		echo "Icon=/opt/$pkgname/data/flutter_assets/images/icon.png"
	} >> PathPlanner.desktop
}

package() {
	cd "$srcdir"
	# make the needed directories
	mkdir -p "$pkgdir/opt/$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/applications"

	# copy over program files to opt
	cp -r "$srcdir/data" "$pkgdir/opt/$pkgname"
	cp -r "$srcdir/lib" "$pkgdir/opt/$pkgname"
	cp "$srcdir/pathplanner" "$pkgdir/opt/$pkgname"

	# make file executable
	chmod +x "$pkgdir/opt/$pkgname/pathplanner"

	# create symlink to executable
	ln -s "/opt/$pkgname/pathplanner" "$pkgdir/usr/bin/pathplanner"

	# copy over desktop file
	cp "$srcdir/PathPlanner.desktop" "$pkgdir/usr/share/applications/PathPlanner.desktop"
}
