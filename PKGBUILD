# Maintainer: Sum01 https://github.com/sum01
pkgname=('vcash-electron')
pkgver=0.31.3
pkgrel=2
pkgdesc="Vcash GUI bundled with the Vcash wallet."
arch=('x86_64')
url="https://github.com/whphhg/vcash-electron"
license=('GPL3' 'AGPL3')
depends=('nodejs' 'npm')
provides=('vcash=0.63.0')
conflicts=('vcash')
backup=('~/.Vcash/data/backups/' '~/.Vcash/data/blockchain/peer/' '~/.Vcash/data/config.dat' '~/.Vcash/data/wallet.dat' '~/.Vcash/data/peers.dat')
source=("https://github.com/whphhg/vcash-electron/releases/download/v$pkgver/Vcash-Electron-GUI-$pkgver-linux64.zip" "https://vcash.info/images/icon.png")
sha256sums=('d7b90bd349fe6be1e08d34d28b170c2c60a6e468c2c36ecfc44da7d3f6705453' '01193e677c3440c53b638d0ff92b6b5d208fe56a1024f2f1e850ea4941ffc1e4')

package() {
	cd $srcdir/linux-unpacked
	chmod a+x vcash-electron
	cd $srcdir/linux-unpacked/resources/app.asar.unpacked/bin
	chmod a+x vcashd-x64
	mkdir -p $pkgdir/usr/{lib/$pkgname,share/applications}/
	cd $srcdir/
	touch $pkgname.desktop
	echo '[Desktop Entry]' > $pkgname.desktop
	echo 'Name=Vcash-electron' >> $pkgname.desktop
	echo "Comment=Vcash wallet GUI" >> $pkgname.desktop
	echo "Exec=/usr/lib/$pkgname/linux-unpacked/vcash-electron %u" >> $pkgname.desktop
	echo "Icon=/usr/lib/$pkgname/icon.png" >> $pkgname.desktop
	echo 'Terminal=false' >> $pkgname.desktop
	echo 'Type=Application' >> $pkgname.desktop
	echo 'Keywords=cryptocurrency;' >> $pkgname.desktop
	echo 'Categories=Network;P2P;' >> $pkgname.desktop
	cp -r $srcdir/linux-unpacked $pkgdir/usr/lib/$pkgname
	cp $srcdir/$pkgname.desktop $pkgdir/usr/share/applications
	cp $srcdir/icon.png $pkgdir/usr/lib/$pkgname
}
