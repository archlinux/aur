#Maintainer Lucas van Leijen <lvanl at tuta dot io>

pkgname=appflowy-bin
_pkgname=appflowy
pkgver=0.1.6
pkgrel=1
pkgdesc="Open source alternative to Notion"
arch=('x86_64')
url="https://www.appflowy.io/"
license=('AGPL')
provides=('appflowy')
conflicts=('appflowy')
depends=('xdg-user-dirs' 'gtk3' 'libkeybinder3' 'openssl-1.1')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AppFlowy-IO/appflowy/releases/download/${pkgver}/AppFlowy_x86_64-unknown-linux-gnu_ubuntu-20.04.tar.gz")
b2sums=('fad0322967266712286c14cafcb7c1cf804a208a861c485d19b1e08cf1788722b0d81009419f05426145a86c473f8eab53cd1b384a899da46c3419b96a62eefb')

package(){
	cd AppFlowy
	install -dDm755 "$pkgdir"/{usr/share/"$_pkgname",usr/bin}
  	cp -a * "$pkgdir/usr/share/$_pkgname/"
  	ln -s "/usr/share/$_pkgname/AppFlowy" "${pkgdir}/usr/bin/$_pkgname"
	install -Dm644 "$srcdir/AppFlowy/$_pkgname.desktop.temp" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	sed -i "4 s/\[CHANGE_THIS\]\/AppFlowy/\/usr\/share\/$_pkgname/" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	sed -i "5 s/\[CHANGE_THIS\]\/AppFlowy\/AppFlowy/\/usr\/bin\/$_pkgname/" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}