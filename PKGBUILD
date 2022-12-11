#Maintainer Lucas van Leijen <lvanl at tuta dot io>

pkgname=appflowy-bin
_pkgname=appflowy
_pkg=AppFlowy
pkgver=0.0.8.1
pkgrel=1
pkgdesc="Open source alternative to Notion"
arch=('x86_64')
url="https://www.appflowy.io/"
license=('AGPL')
provides=('appflowy')
conflicts=('appflowy')
depends=('xdg-user-dirs' 'gtk3' 'libkeybinder3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AppFlowy-IO/appflowy/releases/download/${pkgver}/AppFlowy-linux-x86.tar.gz")
b2sums=('8ca2760f1b5aecbf08e0774ab227d077bca6097b03555596c656900da8208d84c001993376832464df05013af7b91bc1d44f4c37ce462fafdc91cef8a3508a7a')

package(){
	cd $_pkg
	install -dDm755 "$pkgdir"/{usr/share/"$_pkgname",usr/bin}
  	cp -a * "$pkgdir/usr/share/$_pkgname/"
  	ln -s "/usr/share/$_pkgname/app_flowy" "${pkgdir}/usr/bin/$_pkgname"
	install -Dm644 "$srcdir/$_pkg/$_pkgname.desktop.temp" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	sed -i "4 s/\[CHANGE_THIS\]\/AppFlowy/\/usr\/share\/$_pkgname/" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	sed -i "5 s/\[CHANGE_THIS\]\/AppFlowy\/app_flowy/\/usr\/bin\/$_pkgname/" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}