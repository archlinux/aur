# Maintainer: Vresod <lukebinkofsky@gmail.com>

# mad props to the amidst PKGBUILD; i based this off of that

pkgname=among-us-editor
pkgver=1.51.1
pkgrel=2
_jarfile="Among-Us-Editor-${pkgver}-linux.jar"
pkgdesc='Character editor for Among Us'
arch=('any')
license=('MIT')
url='https://github.com/Vresod/Among-Us-Editor/'
depends=('java-runtime>=8' 'sh' 'hicolor-icon-theme')
optdepends=('steam: where among us is usually bought from')
noextract=("$_jarfile")
source=("https://github.com/Vresod/Among-Us-Editor/releases/download/$pkgver/$_jarfile" "AUE.desktop" "icon.png")
sha256sums=("efdb4c0bead17da3332d4f98655c22d3e0626844f2782700d713ada7fe764d98" "1fc76f358a4996594740da38546946040c98e652e7f2a9644fe16bd2d25ddc43" "9bc31e9bb127d780af39aad0a98dd9c98d98b9a0d00f335daa3d123a9f108de1")

build() {
	cd "$srcdir"

	#Create shell script to launch the application
	#
	echo "#!/bin/sh" > AUE.sh
	echo "_JAVA_AWT_WM_NONREPARENTING=1 exec /usr/bin/java -jar '/usr/share/java/$pkgname/AUE.jar' '$@'" >> AUE.sh
}

package() {
	cd "$srcdir"

	install -Dm755 'AUE.sh'             "$pkgdir/usr/bin/among-us-editor"
	install -Dm644 'AUE.desktop'        "$pkgdir/usr/share/applications/AUE.desktop"
	install -Dm644 "$_jarfile"          "$pkgdir/usr/share/java/$pkgname/AUE.jar"
	install -Dm644 "icon.png"            "$pkgdir/usr/share/icons/hicolor/64x64/apps/AUE.png"
}
