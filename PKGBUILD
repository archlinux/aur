
# Maintainer: Your Name <youremail@domain.com>
# Contributor: Asuka Minato
pkgname=trunk-lwt-bin
pkgver=0.0.4
pkgrel=1
pkgdesc="Language learning application."
arch=(x86_64)
url="https://theiceshelf.itch.io/trunk"
license=('unknown')
depends=(electron13-bin bash glibc nodejs gcc-libs)
provides=(trunk)
source=("https://github.com/theiceshelf/trunk/releases/download/v0.0.4/Trunk_0.0.4_amd64.deb"
trunk.sh)
sha256sums=('5f229698d97b688c18b5bb8968d31f2c74232db725ceaa3b39ab6de459238269'
            '469e77db1a61e294e172a294ebdff2888eb88de593be65fce379b06eb4fc9863')


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
