# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=ipfs-desktop-electron-bin
pkgver=0.27.2
pkgrel=1
epoch=
pkgdesc="An unobtrusive and user-friendly desktop application for IPFS on Windows, Mac and Linux."
arch=(x86_64 aarch64)
url="https://ipfs.tech/"
license=('MIT')
groups=()
depends=(electron)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/ipfs-shipyard/ipfs-desktop/releases/download/v0.27.0/ipfs-desktop-0.27.0-linux-amd64.deb"
	https://raw.githubusercontent.com/ipfs/ipfs-desktop/main/LICENSE
)
noextract=()
sha256sums=('3328446caba1b99c21ec83b0943901a34a31e15a0fa11210ee0799611664f546'
	'12987594680fa07203d37f691267bfea6eafc5e8b441f3c9ac7afcbda09c92ef')
validpgpkeys=()

package() {
	tar -xvpf data.tar.* -C "$pkgdir"
	find $pkgdir/opt -type f -not -path "*resources*" -delete
	echo -e '#!/bin/bash\nelectron  "/opt/IPFS Desktop/resources/app.asar"' | install -Dm755 /dev/stdin "${pkgdir}/opt/IPFS Desktop/ipfs-desktop"
	install -Dm644 $srcdir/LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
}
