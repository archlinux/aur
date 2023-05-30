# Maintainer: Jan Keith Darunday <jkcdarunday+aur.archlinux.org@gmail.com>

pkgname=swarm-desktop-bin
pkgver=0.25.0
pkgrel=1
pkgdesc='Swarm client implemented in Go, basic building block for Swarm Network'
arch=('x86_64' 'aarch64')
url='https://github.com/ethersphere/swarm-desktop'
license=('BSD')
depends=('bash')
provides=('swarm-desktop')
conflicts=('swarm-desktop')
source=('LICENSE')
source_x86_64=("$pkgname-$pkgver-x86_64.deb::$url/releases/download/v$pkgver/swarm-desktop_${pkgver}_amd64.deb")
source_aarch64=("$pkgname-$pkgver-aarch64.deb::$url/releases/download/v$pkgver/swarm-desktop_${pkgver}_arm64.deb")
sha256sums=('4be8d688c385633c38b039843922abaf78eef2a3a762add25ade4dcb13de6cd3')
sha256sums_x86_64=('142703db9bdcc3ed0ce18e0dd764c7511a6da9db88879e44bef9d6fc83bd6fb9')
sha256sums_aarch64=('cbdb56f86858317ff9eeb915529a4c917981d01c962b8dc010c26ad4a68a0d90')

prepare() {
    bsdtar -xf data.tar.xz
}

package() {
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 usr/share/applications/swarm-desktop.desktop -t "$pkgdir/usr/share/applications/"
    install -Dm644 usr/share/doc/swarm-desktop/copyright -t "$pkgdir/usr/share/doc/swarm-desktop/"
    install -Dm644 usr/share/lintian/overrides/swarm-desktop -t "$pkgdir/usr/share/lintian/overrides/"
    install -Dm644 usr/share/pixmaps/swarm-desktop.png -t "$pkgdir/usr/share/pixmaps/"

    install -dm755 "$pkgdir/opt"
    cp -r --no-preserve=ownership usr/lib/swarm-desktop "$pkgdir/opt/swarm-desktop"

    install -dm755 "$pkgdir/usr/bin/"
    ln -s /opt/swarm-desktop/swarm-desktop "$pkgdir/usr/bin/swarm-desktop"
}

