# Maintainer: François M. <francois5537 @ gmail.com>

pkgname=manager-accounting
pkgver=15.5.22
pkgrel=1
pkgdesc='Manager is free accounting software for small business'
arch=('i686' 'x86_64')
license=('custom')
url="http://www.manager.io/"
depends=('mono' 'gtk2' 'gtk-sharp-2' 'webkit-sharp')
makedepends=('unzip')
install=manager-accounting.install
options=('!makeflags')
source=("http://download.manager.io/$pkgname.zip"
        "fix-path.patch"
        "manager-accounting.desktop")
sha256sums=('e1e0d411932972d2862eceb9518949dc0797e1d092efa5e45a7f1a5aecd88509'
            '845be6d1c2f90597cac8ec7a35f4661030f067fb91fc7163c98456ffb1776adf'
            'a90354b1af982e8bda3adbcfbfb5ac5f83c6e80da402ecf4a54a0200ed9a6195')

prepare() {
    tar --strip-components=1 -zxvf "manager-accounting_$pkgver.tar.gz"
    patch -p1 -i "${srcdir}/fix-path.patch"
}

package() {
    install -d "$pkgdir"/usr/{lib,share/{applications,icons}}
    cp -r opt/manager-accounting "$pkgdir/usr/lib/"
    cp -r usr/share/icons/* "$pkgdir/usr/share/icons/"
    install -m644 "$pkgname.desktop" "$pkgdir/usr/share/applications/"
}
