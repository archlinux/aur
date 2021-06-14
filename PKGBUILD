# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributors: PastLeo <chgu82837@gmail.com>
# Contributors: koba1t <kobdotsh at gmail dot com>

pkgname=docker-rootless-extras-bin
pkgver=20.10.6
pkgrel=3
pkgdesc="Extras to run docker as non-root."
arch=('x86_64' 'aarch64')
url="https://docs.docker.com/engine/security/rootless/"
license=('Apache')
depends=('docker' 'rootlesskit')
optdepends=('fuse-overlayfs: overlayfs support'
            'slirp4netns: faster network stack')
provides=('docker-rootless' 'docker-rootless-extras')
conflicts=('docker-rootless' 'docker-rootless-extras')
install=$pkgname.install
source=(
	"https://download.docker.com/linux/static/stable/$arch/docker-rootless-extras-$pkgver.tgz"
	"docker.service"
	"docker.socket"
	"99-docker-rootless.conf"
)

sha256sums_x86_64=(
	'ac4d55e87efa1eec306a91f655d8ae00339be5f631b8b41c10d5c588a3cf0473'
	'7c31c7f7755776bf9571e551ff4006035562e4394d88166809dd71b2ba847fc5'
	'd8695293e5d4a814763f13e1d36ed37273040666b4b91363d6c33171df8934c7'
	'd0d790d4c3d887b10b2b155b83a58a44980b9fa638f8c0f1faec0739dc0ef473'
)
sha256sums_aarch64=(
	'b67a3350da99edd549b2aa0eefd60ba7eade0072845b64d5ff0766cf64d82f34'
	'7c31c7f7755776bf9571e551ff4006035562e4394d88166809dd71b2ba847fc5'
	'd8695293e5d4a814763f13e1d36ed37273040666b4b91363d6c33171df8934c7'
	'd0d790d4c3d887b10b2b155b83a58a44980b9fa638f8c0f1faec0739dc0ef473'
)

package() {
	mkdir -p "$pkgdir/usr/bin/"

	install -Dm755 "$srcdir/docker-rootless-extras/dockerd-rootless-setuptool.sh" "$pkgdir/usr/bin/"
	install -Dm755 "$srcdir/docker-rootless-extras/dockerd-rootless.sh" "$pkgdir/usr/bin/"
	install -Dm755 "$srcdir/docker-rootless-extras/vpnkit" "$pkgdir/usr/bin/"
	install -Dm644 "$srcdir/docker.service" "$pkgdir/usr/lib/systemd/user/docker.service"
	install -Dm644 "$srcdir/docker.socket" "$pkgdir/usr/lib/systemd/user/docker.socket"
	install -Dm644 "$srcdir/99-docker-rootless.conf" "$pkgdir/usr/lib/sysctl.d/99-docker-rootless.conf"
}
