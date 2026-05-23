# Maintainer: Gilwiljam <gillbilljam@gmail.com>
# Contributor: Samuel Corsi-House <chouse.samuel@gmail.com>
_pkgname=playit
pkgname=$_pkgname-bin
pkgver=1.0.4
pkgrel=1
pkgdesc="A tunneling tool to host a game server without port forwarding or sharing public IP (Binary version)"
arch=('x86_64' 'aarch64' 'i686' 'armv7h')
url="https://github.com/playit-cloud/playit-agent"
license=('BSD-2-Clause') 
provides=('playit')
conflicts=(playit)

source_x86_64=("$_pkgname-$pkgver.deb::https://playit-cloud.github.io/ppa/data/${_pkgname}_${pkgver}_amd64.deb")  
sha256sums_x86_64=('8462bff95696e6e0344821224338c2231332ae79b8f573c96c1fdc28e0d1e6c3')

source_aarch64=("$_pkgname-$pkgver.deb::https://playit-cloud.github.io/ppa/data/${_pkgname}_${pkgver}_arm64.deb")
sha256sums_aarch64=('9fb5d335a2cfccc019cd4923bb203c3b253ff7625cbb1899e3714326bd0c6c3f')

source_i686=("$_pkgname-$pkgver.deb::https://playit-cloud.github.io/ppa/data/${_pkgname}_${pkgver}_i386.deb")
sha256sums_i686=('64d55c89ca274a733af98484035cb2ff45b25d897fa5c9e9800a545823f84477')

source_armv7h=("$_pkgname-$pkgver.deb::https://playit-cloud.github.io/ppa/data/${_pkgname}_${pkgver}_armhf.deb")
sha256sums_armv7h=('8c2e4b1b466d02673f722cc97178f449f8f83f29abab53709d510329d2d14e4b')

source=("LICENSE.txt::https://raw.githubusercontent.com/playit-cloud/playit-agent/master/LICENSE.txt") 
sha256sums=('SKIP')


package() {
	bsdtar -xf data.tar.gz -C "$pkgdir/"

	mv "$pkgdir/lib/systemd" "$pkgdir/etc"
	rm -r "$pkgdir/lib"

	mkdir -p "$pkgdir/usr/bin"
	ln -s "/opt/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
