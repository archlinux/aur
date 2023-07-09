# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=ipfs-desktop-electron-bin
pkgver=0.29.0
pkgrel=2
pkgdesc="An unobtrusive and user-friendly desktop application for IPFS on Windows, Mac and Linux."
arch=(x86_64 aarch64)
url="https://ipfs.tech/"
license=('MIT')
depends=(electron)
source=("https://github.com/ipfs-shipyard/ipfs-desktop/releases/download/v${pkgver}/ipfs-desktop-${pkgver}-linux-amd64.deb"
	https://raw.githubusercontent.com/ipfs/ipfs-desktop/main/LICENSE
)
sha256sums=('3b071eec3363ad27018867541bf622194eba3f33af2a5eb212ba7e0fb450c394'
            '12987594680fa07203d37f691267bfea6eafc5e8b441f3c9ac7afcbda09c92ef')

package() {
	tar -xvpf data.tar.* -C "$pkgdir"
	find $pkgdir/opt -type f -not -path "*resources/*" -delete
	echo -e '#!/bin/bash\nelectron  "/opt/IPFS Desktop/resources/app.asar"' | install -Dm755 /dev/stdin "${pkgdir}/opt/IPFS Desktop/ipfs-desktop"
	install -Dm644 $srcdir/LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
}
