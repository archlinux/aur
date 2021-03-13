# Maintainer: Alex Colburn <alcolbur@nmu.edu>
pkgname=eclipse-java-bin
pkgver=4.18
_releasemonth="2020-12"
pkgrel=1
pkgdesc="Highly extensible IDE"
arch=('x86_64')
url="https://www.eclipse.org"
license=('EPL')
depends=("java-environment>=11" "python" "libsecret")
makedepends=('tar')
provides=('eclipse-java')
conflicts=('eclipse-java')
source=("https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/$_releasemonth/R/${pkgname%-bin}-$_releasemonth-R-linux-gtk-x86_64.tar.gz&r=1"
			"eclipse.desktop"
			"eclipse.png")
sha512sums=('1d5aac59454d35175c6b388674d23de91f45d953141389d82b5557d46de92beb2b14396427bfab8f6b198ed58bed67094755d26d3d379c92733f2a74d51b02bd'
			'eb3e245f27a0eb328bdf3dcc1258013d55cf24d4ec3864cdc0ad9c68995bfc1af44f05a5973368f115e9957359c9e50b4cefa2fa7014c36e499447c48769f505'
			'7933c44f9e4d47aa89706e839fd5f1339e58454125cc8533ea4d7d391f677805ebcb937857ccea305f8829a2e8c6b38dc0447491ad0fbd26e55fcad6c782128f')

package() {
	tar -xzf "${pkgname%-bin}-$_releasemonth-R-linux-gtk-$CARCH.tar.gz&r=1"
	mkdir -p "$pkgdir/opt"
	mv ./eclipse "$pkgdir/opt/"
	mkdir -p "$pkgdir/usr/bin"
	ln -sv /opt/eclipse/eclipse "$pkgdir/usr/bin/eclipse"
	install -Dm644 eclipse.desktop "$pkgdir/usr/share/applications/eclipse.desktop"
	install -Dm644 eclipse.png "$pkgdir/usr/share/pixmaps/eclipse.png"
	# Uncomment these lines if you want pacman -R to remove some extra eclipse files
	# Will cause problems if you have other versions of eclipse installed
	#mkdir -p "${pkgdir}${HOME}/.m2"
	#mkdir -p "${pkgdir}${HOME}/.p2"
}
