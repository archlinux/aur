# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=ipfs-desktop-electron-bin
pkgver=0.30.1
pkgrel=1
pkgdesc="An unobtrusive and user-friendly desktop application for IPFS on Windows, Mac and Linux."
arch=(x86_64 aarch64)
url="https://ipfs.tech/"
license=('MIT')
depends=(electron)
source=("https://github.com/ipfs-shipyard/ipfs-desktop/releases/download/v${pkgver}/ipfs-desktop-${pkgver}-linux-amd64.deb"
	https://raw.githubusercontent.com/ipfs/ipfs-desktop/main/LICENSE
)
sha256sums=('1ebe769543d6234e9cef6874dcd78acb6e6c7c155a5fc0c266ea5f012d813e28'
            '12987594680fa07203d37f691267bfea6eafc5e8b441f3c9ac7afcbda09c92ef')

package() {
	tar -xvpf data.tar.* -C "$pkgdir"
	find $pkgdir/opt -type f -not -path "*resources/*" -delete
	echo -e '#!/bin/bash\nelectron  "/opt/IPFS Desktop/resources/app.asar"' | install -Dm755 /dev/stdin "${pkgdir}/opt/IPFS Desktop/ipfs-desktop"
	install -Dm644 $srcdir/LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
}
