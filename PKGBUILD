# Maintainer: Alex Daum <alexander.daum@mailbox.org>
pkgname=eclipse-cpp-bin
pkgver=1.0
_releasemonth="2021-03"
pkgrel=1
pkgdesc="Highly extensible IDE"
arch=('x86_64')
url="https://www.eclipse.org"
license=('EPL')
depends=("java-environment>=11" "python" "libsecret")
makedepends=('tar')
provides=('eclipse-cpp')
conflicts=('eclipse-cpp')
source=("https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/$_releasemonth/R/${pkgname%-bin}-$_releasemonth-R-linux-gtk-$CARCH.tar.gz&r=1"
			"eclipse-cpp.desktop"
			"eclipse-cpp.png")
sha512sums=('e6108c65e4720a068529008d5fcdf51d9748d7f332f3e8ae9f4bf058b99ecd14903b6579c8466f9b6b71543cf0ba2988724f5845998883e0a6cce80394560ae4'
			'7f83cadc9827f4caaa80b68caaf3c9ffe629f861bb0ea0d6fe8b473f7e0f26a7e088aed48e3dbd757e2363c5375a7c2af2f33fd429e9ee1f50d72c3ffb868b49'
			'7933c44f9e4d47aa89706e839fd5f1339e58454125cc8533ea4d7d391f677805ebcb937857ccea305f8829a2e8c6b38dc0447491ad0fbd26e55fcad6c782128f')

package() {
	tar -xzf "${pkgname%-bin}-$_releasemonth-R-linux-gtk-$CARCH.tar.gz&r=1"
	mkdir -p "$pkgdir/opt"
	mv ./eclipse ./eclipse-cpp
	mv ./eclipse-cpp "$pkgdir/opt/"
	mkdir -p "$pkgdir/usr/bin"
	ln -sv /opt/eclipse-cpp/eclipse "$pkgdir/usr/bin/eclipse-cpp"
	install -Dm644 eclipse-cpp.desktop "$pkgdir/usr/share/applications/eclipse-cpp.desktop"
	install -Dm644 eclipse-cpp.png "$pkgdir/usr/share/pixmaps/eclipse-cpp.png"
	# Uncomment these lines if you want pacman -R to remove some extra eclipse files
	# Will cause problems if you have other versions of eclipse installed
	#mkdir -p "${pkgdir}${HOME}/.m2"
	#mkdir -p "${pkgdir}${HOME}/.p2"
}
