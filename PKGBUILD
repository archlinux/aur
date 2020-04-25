#maintainer lxgr <lxgr@protonmail.com>
pkgname=xfce4-sysinfo
pkgver=0.4
pkgrel=1
pkgdesc="A tool to show systeminformation in xfce"
arch=(any)
url="https://github.com/lxgr-linux/xfce4-sysinfo"
license=('GPL v3')
depends=('gtk3' 'gtkdialog' 'zenity')
makedepends=('git')

source=("$pkgname"::'git://github.com/lxgr-linux/xfce4-sysinfo.git')
md5sums=('SKIP')

pkgver() {
	    cd "$pkgname"
	        echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare(){
	cd "$srcdir/$pkgname"
	chmod +x sysinfo
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/applications" "xfce4-sysinfo.desktop"
	install -Dm0644 -t "$pkgdir/usr/share/xfce4-sysinfo" "xfce4-sysinfo/*"
	install -Dm0755 -t "$pkgdir/usr/bin" "sysinfo"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
