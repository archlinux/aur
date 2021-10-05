# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributors: PastLeo <chgu82837@gmail.com>
# Contributors: koba1t <kobdotsh at gmail dot com>

pkgname=docker-rootless-extras-bin
pkgver=20.10.9
pkgrel=1
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
	"docker.service"
	"docker.socket"
	"99-docker-rootless.conf"
)
source_x86_64=(
	"$pkgname-x86_64-$pkgver.tgz::https://download.docker.com/linux/static/stable/x86_64/docker-rootless-extras-$pkgver.tgz"
)
source_aarch64=(
	"$pkgname-aarch64-$pkgver.tgz::https://download.docker.com/linux/static/stable/aarch64/docker-rootless-extras-$pkgver.tgz"
)

sha256sums=('7c31c7f7755776bf9571e551ff4006035562e4394d88166809dd71b2ba847fc5'
            'd8695293e5d4a814763f13e1d36ed37273040666b4b91363d6c33171df8934c7'
            'd0d790d4c3d887b10b2b155b83a58a44980b9fa638f8c0f1faec0739dc0ef473')
sha256sums_x86_64=('5c14e2e105cc5355e34f7173792f12d9c26aa4aac38f4b24f7cde7f9b0bfbe73')
sha256sums_aarch64=('2af6a222491042937ac4fab411cd160f60cb742de3499d196dea9deac6eb1942')

package() {
	mkdir -p "$pkgdir/usr/bin/"

	install -Dm755 "$srcdir/docker-rootless-extras/dockerd-rootless-setuptool.sh" "$pkgdir/usr/bin/"
	install -Dm755 "$srcdir/docker-rootless-extras/dockerd-rootless.sh" "$pkgdir/usr/bin/"
	install -Dm755 "$srcdir/docker-rootless-extras/vpnkit" "$pkgdir/usr/bin/"
	install -Dm644 "$srcdir/docker.service" "$pkgdir/usr/lib/systemd/user/docker.service"
	install -Dm644 "$srcdir/docker.socket" "$pkgdir/usr/lib/systemd/user/docker.socket"
	install -Dm644 "$srcdir/99-docker-rootless.conf" "$pkgdir/usr/lib/sysctl.d/99-docker-rootless.conf"
}
