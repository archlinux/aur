# Maintainer: François M. <francois5537 @ gmail.com>

pkgname=manager-accounting
pkgver=15.5.82
pkgrel=2
pkgdesc='Manager is free accounting software for small business'
arch=('i686' 'x86_64')
license=('custom')
url="http://www.manager.io/"
depends=('mono' 'gtk2' 'gtk-sharp-2' 'webkit-sharp')
makedepends=('unzip')
install=manager-accounting.install
options=('!makeflags')
source=("http://download.manager.io/$pkgname.zip"
        "fix-path.patch")
sha256sums=('e8d1d8887b5d3ddcb65f3d3d722aa30427f964e58cb70d87928bb235c11f83fc'
            '81e73bbae1a386dc76bd1f8b018868864c802cb242667d18b9d6f005518859f7')

prepare() {
    tar --strip-components=1 -zxvf "manager-accounting_$pkgver.tar.gz"
    patch -p1 -i "${srcdir}/fix-path.patch"
}

package() {
    install -d $pkgdir/usr/{bin,lib,share/{applications,icons}}
    cp -r opt/manager-accounting $pkgdir/usr/lib/
    cp -r usr/share/icons/* $pkgdir/usr/share/icons/
    ln -s /usr/lib/manager-accounting/manager-accounting $pkgdir/usr/bin/manager-accounting
    install -m644 usr/share/applications/"$pkgname.desktop" "$pkgdir/usr/share/applications/"
}
