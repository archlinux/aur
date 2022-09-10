#Maintainer Lucas van Leijen <lvanl at tuta dot io>

pkgname=appflowy-bin
_pkgname=appflowy
_pkg=AppFlowy
pkgver=0.0.5
pkgrel=1
pkgdesc="An Open Source Alternative to Notion"
arch=('x86_64')
url="https://www.appflowy.io/"
license=('AGPL')
provides=('appflowy')
conflicts=('appflowy' 'appflowy-git')
depends=('xdg-user-dirs' 'gtk3' 'libkeybinder3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AppFlowy-IO/appflowy/releases/download/${pkgver}/AppFlowy-linux-x86.tar.gz")
sha256sums=('5cb08903cb5db65cb4d91faa40be260927d917b8594f77e90ba9e7df19b1f15a')

package(){
	cd $_pkg
	install -dDm755 "$pkgdir"/{usr/share/"$_pkgname",usr/bin}
  	cp -a * "$pkgdir/usr/share/$_pkgname/"
  	ln -s "/usr/share/$_pkgname/app_flowy" "${pkgdir}/usr/bin/$_pkgname"
	install -Dm644 "$srcdir/$_pkg/$_pkgname.desktop.temp" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	sed -i "4 s/\[CHANGE_THIS\]\/AppFlowy/\/usr\/share\/$_pkgname/" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	sed -i "5 s/\[CHANGE_THIS\]\/AppFlowy\/app_flowy/\/usr\/bin\/$_pkgname/" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}