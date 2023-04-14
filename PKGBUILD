# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=trunk-lwt-bin
pkgver=0.0.4
pkgrel=1
epoch=
pkgdesc="Language learning application."
arch=(x86_64)
url="https://theiceshelf.itch.io/trunk"
license=('unknown')
groups=()
depends=(electron13-bin bash glibc nodejs gcc-libs)
makedepends=()
checkdepends=()
optdepends=()
provides=(trunk)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/theiceshelf/trunk/releases/download/v0.0.4/Trunk_0.0.4_amd64.deb"
trunk.sh)
noextract=()
sha256sums=('5f229698d97b688c18b5bb8968d31f2c74232db725ceaa3b39ab6de459238269'
            '469e77db1a61e294e172a294ebdff2888eb88de593be65fce379b06eb4fc9863')
validpgpkeys=()


package() {
	tar -xvpf data.* -C "$pkgdir"
	for f in "$pkgdir"/opt/Trunk/*;
	do
		local filename
		filename=$(basename "$f")
		if [ "$filename" != "resources" ];
		then
			rm -rf "$f"
		fi 
	done
	sed -i "s!Exec=.*!Exec=/usr/bin/trunk!" "$pkgdir"/usr/share/applications/trunk.desktop
	sed -i "s!Icon=.*!Icon=/usr/share/icons/hicolor/0x0/apps/trunk.png!" "$pkgdir"/usr/share/applications/trunk.desktop
	install -Dm755 trunk.sh "$pkgdir"/usr/bin/trunk
}
