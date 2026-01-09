# Maintainer: AlphaLynx <alphalynx@alphalynx.dev>
# Contributor: milaq <micha.laqua@gmail.com>

pkgname=xmousepasteblock-git
pkgver=1.4.r0.gc4ee870
pkgrel=2
pkgdesc='Userspace tool to disable middle mouse button paste in Xorg'
arch=(i686 x86_64)
url='https://github.com/milaq/XMousePasteBlock'
license=(GPL-2.0-only)
depends=(glibc libev libx11 libxi)
makedepends=(git)
provides=(xmousepasteblock)
conflicts=(xmousepasteblock)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
    cd XMousePasteBlock
    git describe --long --tags --abbrev=7 | sed 's/-/.r/;s/-/./'
}

build() {
    cd XMousePasteBlock
    make
}

package() {
    cd XMousePasteBlock
    install -Dm644 xmousepasteblock.service -t "$pkgdir/usr/lib/systemd/user"
    make DESTDIR="$pkgdir/" install
}
