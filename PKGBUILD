# Maintainer: pappy@a_s_c_e_l_i_o_n.c_o_m

pkgname=dbeaver-ce
pkgver=6.3.0
pkgrel=6
pkgdesc="DBeaver Community Edition"
arch=('x86_64')
url="https://github.com/dbeaver/dbeaver"
license=("GPL")
depends=('java-runtime>=1.8' 'gtk2' 'gtk-update-icon-cache' 'libsecret')
conflicts=(dbeaver dbeaver-ee)
optdepends=('dbeaver-plugin-office: export data in Microsoft Office Excel format'
			'dbeaver-plugin-svg-format: save diagrams in SVG format')

source=("$pkgname-$pkgver-linux.gtk.x86_64.tar.gz::https://github.com/dbeaver/dbeaver/releases/download/$pkgver/$pkgname-$pkgver-linux.gtk.x86_64.tar.gz"
		"$pkgname-$pkgver-git::git+https://github.com/dbeaver/dbeaver.git#tag=$pkgver"
		dbeaver-ce.desktop)
sha256sums=('4a086f0182d349bbcc8d9c927e293d7b937eef90b8dcffff47db41e9a6c8421e'
            'SKIP'
            'e73e524d2ce9ff9750d805ed2ef9f9bd4058910db05d5095aef275b71e4001e8')

package() {
	pushd $srcdir/$pkgname-$pkgver-git/product/standalone
	for _size in 16 32 48 64 128 256 512; do
		install -m 644 -D icons-sources/icon_${_size}x${_size}.png \
			$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/$pkgname.png
	done
	for _type in xpm png; do
		install -m 644 -D icons/dbeaver.$_type \
			$pkgdir/usr/share/pixmaps/$pkgname.$_type
	done
	popd

    mkdir -p $pkgdir/usr/bin
    ln -s /usr/share/$pkgname/dbeaver $pkgdir/usr/bin/$pkgname
    cp -a $srcdir/dbeaver $pkgdir/usr/share/$pkgname
    chmod +x $pkgdir/usr/share/$pkgname/dbeaver
    install -m 644 -D $srcdir/dbeaver-ce.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}

