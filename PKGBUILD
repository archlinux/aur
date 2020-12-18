# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributors: PastLeo <chgu82837@gmail.com>
# Contributors: koba1t <kobdotsh at gmail dot com>

pkgname=docker-rootless-extras-bin
pkgver=20.10.1
pkgrel=1
pkgdesc="Extras to run docker as non-root."
arch=('x86_64')
url="https://docs.docker.com/engine/security/rootless/"
license=('Apache')
depends=('docker')
optdpends=('fuse-overlayfs: overlayfs support'
           'slirp4netns: faster network stack')
provides=('docker-rootless' 'docker-rootless-extras')
conflicts=('docker-rootless' 'docker-rootless-extras')
install=$pkgname.install
source=(
	"https://download.docker.com/linux/static/stable/x86_64/docker-rootless-extras-$pkgver.tgz"
	"docker.service"
	"docker.socket"
)

sha256sums=('12e6bccb2ebbb3386a0157d04c03950cbab670bdd910ed408d8740d0e1543af9'
            '87b4bd7f8a1dc0462f58a25a5f8513eb316c45b2748dff5f4d2e2fa59be3f037'
            'd8695293e5d4a814763f13e1d36ed37273040666b4b91363d6c33171df8934c7')

package() {
	mkdir -p "$pkgdir/usr/bin/"

	install -Dm755 "$srcdir/docker-rootless-extras/"* "$pkgdir/usr/bin/"
	install -Dm644 "$srcdir/docker.service" "$pkgdir/usr/lib/systemd/user/docker.service"
	install -Dm644 "$srcdir/docker.socket" "$pkgdir/usr/lib/systemd/user/docker.socket"
}
