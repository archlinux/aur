# Maintainer: Aleksandr <4le34n at gmail dot com>

pkgname=eve-ng-integration-git
_pkgname=eve-ng-integration
pkgver=r63.3faa8ad
pkgrel=4
pkgdesc="Integrates EVE-NG (aka UNetLab) with Linux desktop"
arch=('any')
url="http://eve-ng.net"
license=('MIT')
depends=('python' 'inetutils')
optdepends=('wireshark-gtk' 'wireshark-qt' 'x11-ssh-askpass' 'vinagre' 'python2-docker')
makedepends=('git')
install=install
source=('eve-ng-integration::git+https://github.com/SmartFinn/eve-ng-integration.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install post-install
        #sed -i "s|python|python2|" "$pkgdir/usr/bin/$_pkgname"
        install -Dm644 README.md "${pkgdir}/usr/share/doc/$_pkgname/README.md"
        install -Dm644 demo.gif "${pkgdir}/usr/share/doc/$_pkgname/demo.gif"
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$_pkgname/LICENSE"
}
