# Maintainer: Pierre Grasser <pierre.grasser@proton.me>
pkgname=custom-install
pkgver=2.1
pkgrel=2
pkgdesc="Installs a title directly to an SD card for the Nintendo 3DS"
arch=('any')
url="https://github.com/ihaveamac/custom-install"
license=('MIT')
depends=('python' 'python-events' 'python-pyctr' 'save3ds_fuse')
optdepends=('tk: GUI support')
source=("https://github.com/ihaveamac/custom-install/archive/refs/tags/v$pkgver.tar.gz"
        "https://github.com/ihaveamac/custom-install/releases/download/v$pkgver/custom-install-finalize.3dsx"
        'custominstall.sh'
        'ci-gui.sh'
        'com.github.ihaveamac.CustomInstall.desktop')
md5sums=('9feee3d472c444bc5662c5d38783a624'
         'd7c4f5b41bb30dc7db978a2ffe61ad4e'
         '8428490bcd8068b4c12812d9daf26435'
         '52ec8eb031d26f49fecbb8f04871a0cd'
         '1283d9e3f3b9b7f976a73b73f1656bb9')

package() {
	cd "$srcdir/$pkgname-$pkgver"

    # CLI
    install -Dm644 -t "$pkgdir/usr/lib/$pkgname/" custominstall.py
    # GUI
    install -Dm644 -t "$pkgdir/usr/lib/$pkgname/" ci-gui.py
    # Wrappers for /usr/bin
    install -Dm755 "$srcdir/custominstall.sh" "$pkgdir/usr/bin/custominstall"
    install -Dm755 "$srcdir/ci-gui.sh" "$pkgdir/usr/bin/ci-gui"

    # Title DB
    install -Dm644 -t "$pkgdir/usr/lib/$pkgname/" title.db.gz
    # custom-install-finalize 3DSX
    install -Dm644 -t "$pkgdir/usr/lib/$pkgname/" "$srcdir/custom-install-finalize.3dsx"

    # Symlink save3ds_fuse
    mkdir -p "$pkgdir/usr/lib/$pkgname/bin/linux/"
    ln -sf /usr/bin/save3ds_fuse "$pkgdir/usr/lib/$pkgname/bin/linux/save3ds_fuse"

    # License
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
    # README
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md

    # Desktop file
    install -Dm644 -t "$pkgdir/usr/share/applications/" "$srcdir/com.github.ihaveamac.CustomInstall.desktop"
}
