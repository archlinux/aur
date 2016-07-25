# Maintainer: Philippe Miron <tuxication@gmail.com>

pkgname=cryptocat
pkgver=3.2.02
pkgrel=1
epoch=0
pkgdesc="Free software with a simple mission: everyone should be able to chat with their friends in privacy"
arch=("x86_64")
url="https://crypto.cat"
license=("GPL")
groups=()
depends=()
makedepends=('gendesk' 'gnupg')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://download.crypto.cat/client/Cryptocat-linux-x64.zip") 
noextract=()
md5sums=('32be7089f9417d9ac533845387086216')
validpgpkeys=()

prepare() {
	unzip $srcdir/Cryptocat.zip -d $pkgname
	cp -R $srcdir/$pkgname/Cryptocat-linux-x64/* $pkgname
	rm -R $srcdir/$pkgname/Cryptocat-linux-x64
	gpg2 --verify Cryptocat.zip.asc Cryptocat.zip
	gendesk -n --pkgname "$pkgname" --pkgdesc "$pkgdesc"
}

build() {
	msg "The package $pkgname is already compiled."
}

package() {
	# Install the main app
	install -dm755 "$pkgdir/opt/"
  	cp -r $pkgname $pkgdir/opt
	
	# desktop file
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "$pkgname/logo.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

	# Create a symlink to /usr/bin
  	install -d "$pkgdir/usr/bin/"
  	ln -sf /opt/${pkgname}/Cryptocat "$pkgdir/usr/bin/$pkgname"
  	chmod 755 "${pkgdir}/opt/${pkgname}/Cryptocat"
}
