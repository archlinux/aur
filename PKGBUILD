#Maintainer Lucas van Leijen <lvanl at tuta dot io>

pkgname=appflowy-bin
_pkgname=appflowy
_pkgpath=AppFlowy_x86_64-unknown-linux-gnu_ubuntu-20.04/AppFlowy
pkgver=0.1.4
pkgrel=2
pkgdesc="Open source alternative to Notion"
arch=('x86_64')
url="https://www.appflowy.io/"
license=('AGPL')
provides=('appflowy')
conflicts=('appflowy')
depends=('xdg-user-dirs' 'gtk3' 'libkeybinder3' 'openssl-1.1')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AppFlowy-IO/appflowy/releases/download/${pkgver}/AppFlowy_x86_64-unknown-linux-gnu_ubuntu-20.04.tar.gz")
b2sums=('a62ad0d7b60b2bee86282a868bdd5a5592b328b766fb1bf873962f191a9d3dcf48d537e31c61bf859abe74f475ea8c7688fc32208cc144140157ca58fb6c482a')

package(){
	cd $_pkgpath
	install -dDm755 "$pkgdir"/{usr/share/"$_pkgname",usr/bin}
  	cp -a * "$pkgdir/usr/share/$_pkgname/"
  	ln -s "/usr/share/$_pkgname/AppFlowy" "${pkgdir}/usr/bin/$_pkgname"
	install -Dm644 "$srcdir/$_pkgpath/$_pkgname.desktop.temp" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	sed -i "4 s/\[CHANGE_THIS\]\/AppFlowy/\/usr\/share\/$_pkgname/" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	sed -i "5 s/\[CHANGE_THIS\]\/AppFlowy\/AppFlowy/\/usr\/bin\/$_pkgname/" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}