# Maintainer: Aleksandr <4le34n at gmail dot com>

pkgname=eve-ng-integration-git
pkgver=r63.3faa8ad
pkgrel=1
pkgdesc="Integrates EVE-NG (aka UNetLab) with Linux desktop"
arch=('x86_64')
url="http://eve-ng.net"
license=('GPL')
depends=('python2' 'inetutils')
optdepends=('wireshark-gtk' 'wireshark-qt' 'x11-ssh-askpass' 'vinagre' 'python2-docker')
makedepends=('git')
source=('eve-ng-integration::git+https://github.com/SmartFinn/eve-ng-integration.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install post-install
        sed -i "s|python|python2|" "$pkgdir/usr/bin/eve-ng-integration"
}
