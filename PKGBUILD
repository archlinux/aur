# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=ipfs-desktop-electron-bin
pkgver=0.27.0
pkgrel=1
epoch=
pkgdesc="An unobtrusive and user-friendly desktop application for IPFS on Windows, Mac and Linux."
arch=(x86_64)
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
ipfs-desktop.sh
https://raw.githubusercontent.com/ipfs/ipfs-desktop/main/LICENSE
)
noextract=()
sha256sums=('3328446caba1b99c21ec83b0943901a34a31e15a0fa11210ee0799611664f546'
            '98dbb9525cefe2c32563708d95df999174bdd20b20897efc48905fc08b4801ef'
            '12987594680fa07203d37f691267bfea6eafc5e8b441f3c9ac7afcbda09c92ef')
validpgpkeys=()

package() {
	tar -xvpf data.tar.* -C "$pkgdir"
	for f in "$pkgdir/opt/IPFS Desktop"/*;
	do	
		local name
		name=$(basename "$f")
		if [ "$name" != "resources" ];
		then
			rm -rf "$f"
		fi
	done
	install -Dm755 ipfs-desktop.sh "${pkgdir}/opt/IPFS Desktop/ipfs-desktop"
	install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
}
