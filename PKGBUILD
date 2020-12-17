# Maintainer: koba1t <kobdotsh at gmail dot com>
pkgname=docker-rootless-extras
pkgver=20.10.1
pkgrel=1
pkgdesc="Docker daemon as a non-root user (Rootless mode) with docker package"
arch=('x86_64')
url="https://docs.docker.com/engine/security/rootless/"
license=('Apache')
depends=('docker')
optdepends=('fuse-overlayfs: overlayfs support'
            'slirp4netns: faster network stuck')
provides=('docker-rootless-extras')
install=docker-rootless-extras.install
source=("https://download.docker.com/linux/static/stable/$CARCH/$pkgname-$pkgver.tgz"
		"60-$pkgname.sysctl"
		"dockerd-rootless.service")
sha256sums=('12e6bccb2ebbb3386a0157d04c03950cbab670bdd910ed408d8740d0e1543af9'
            'd0d790d4c3d887b10b2b155b83a58a44980b9fa638f8c0f1faec0739dc0ef473'
            '806e31e1e368a9dd9e26d2eaa856551e40b505cd8f36b12291965c5810971aca')

package() {
	mkdir -p "$pkgdir/usr/bin/"
	install -Dm755 "$srcdir/docker-rootless-extras/"* "$pkgdir/usr/bin/"
	install -Dm644 "$srcdir/60-$pkgname.sysctl" "$pkgdir/usr/lib/sysctl.d/60-$pkgname.conf"
	install -Dm644 "$srcdir/dockerd-rootless.service" "/usr/lib/systemd/user/"
}
