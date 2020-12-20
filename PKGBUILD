# Maintainer: Vresod <lukebinkofsky@gmail.com>

# mad props to the amidst PKGBUILD; i based this off of that

pkgname=among-us-editor
pkgver=1.6
pkgrel=5
_jarfile="Among-Us-Editor-${pkgver}.jar"
pkgdesc='Character editor for Among Us'
arch=('any')
license=('MIT')
url='https://github.com/Koupah/Among-Us-Editor/'
depends=('java-runtime>=8' 'sh' 'hicolor-icon-theme')
optdepends=('steam: where among us is usually bought from')
noextract=("$_jarfile")
source=("https://github.com/Koupah/Among-Us-Editor/releases/download/$pkgver/$_jarfile" "AUE.desktop" "icon.png" "LICENSE")
sha256sums=("657816ad906b342bd915a0046bd78198f35576f1b72ba4fd2223848031612d50" "1fc76f358a4996594740da38546946040c98e652e7f2a9644fe16bd2d25ddc43" "SKIP" "SKIP" )

build() {
	cd "$srcdir"

	#Create shell script to launch the application
	echo "#!/bin/sh" > AUE.sh
	echo "_JAVA_AWT_WM_NONREPARENTING=1 exec /usr/bin/java -jar '/usr/share/java/$pkgname/AUE.jar' '$@'" >> AUE.sh
}

package() {
	cd "$srcdir"

	install -Dm755 'AUE.sh'             "$pkgdir/usr/bin/among-us-editor"
	install -Dm644 'AUE.desktop'        "$pkgdir/usr/share/applications/AUE.desktop"
	install -Dm644 "$_jarfile"          "$pkgdir/usr/share/java/$pkgname/AUE.jar"
	install -Dm644 "icon.png"           "$pkgdir/usr/share/icons/hicolor/64x64/apps/AUE.png"
	install -Dm644 LICENSE              "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 
}
