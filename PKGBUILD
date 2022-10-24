#Maintainer Lucas van Leijen <lvanl at tuta dot io>

pkgname=appflowy-beta-bin
_pkgname=appflowy
_pkg=AppFlowy
pkgver=0.0.6
pkgrel=1
pkgdesc="Open source alternative to Notion"
arch=('x86_64')
url="https://www.appflowy.io/"
license=('AGPL')
provides=('appflowy')
conflicts=('appflowy')
depends=('xdg-user-dirs' 'gtk3' 'libkeybinder3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AppFlowy-IO/appflowy/releases/download/${pkgver}/AppFlowy-linux-x86.tar.gz")
b2sums=('606341e25dd9a4408bc42b0f8ded7233b0e6969224d3ffc6175ec00cc81c5adce5a2d5ff5a76de636dcfcc6ae4abf92ff5392dae6b0ae434abb9aba6eabc0f54')

package(){
	cd $_pkg
	install -dDm755 "$pkgdir"/{usr/share/"$_pkgname",usr/bin}
  	cp -a * "$pkgdir/usr/share/$_pkgname/"
  	ln -s "/usr/share/$_pkgname/app_flowy" "${pkgdir}/usr/bin/$_pkgname"
	install -Dm644 "$srcdir/$_pkg/$_pkgname.desktop.temp" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	sed -i "4 s/\[CHANGE_THIS\]\/AppFlowy/\/usr\/share\/$_pkgname/" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	sed -i "5 s/\[CHANGE_THIS\]\/AppFlowy\/app_flowy/\/usr\/bin\/$_pkgname/" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}