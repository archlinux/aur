# Maintainer: ftk

_pkgname='wireproxy-awg'
pkgname="${_pkgname}-bin"
pkgver=1.0.16
pkgrel=1
pkgdesc="AmneziaWG compatible wireguard client that exposes itself as a socks5 proxy"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/artem-russkikh/wireproxy-awg"
license=('ISC-1')
depends=('glibc')
provides=(${_pkgname} wireproxy)
conflicts=(${_pkgname} wireproxy)
source_x86_64=("wireproxy_${pkgver}_x86_64.tar.gz::${url}/releases/download/v${pkgver}/wireproxy_linux_amd64.tar.gz")
source_aarch64=("wireproxy_${pkgver}_aarch64.tar.gz::${url}/releases/download/v${pkgver}/wireproxy_linux_arm64.tar.gz")
source_armv7h=("wireproxy_${pkgver}_armv7h.tar.gz::${url}/releases/download/v${pkgver}/wireproxy_linux_arm.tar.gz")
sha256sums_x86_64=('5badb6b566f7ade3b5f94cbd233ff4437b3f5888d5a40f615fa87a8dedb36534')
sha256sums_aarch64=('251b8526a0fde931adaa2852afdea860d662bfdebfef6ddba61756851024bf8e')
sha256sums_armv7h=('ef980f4244b226726b6e2f9bb8f35373df0e04bb2598bd90d8138e908861c2e4')


package() {
    install -Dm755 "$srcdir/wireproxy" "$pkgdir/usr/bin/wireproxy"
}

_update_pkg() {
    curl -Ssf "${url}/releases.atom" | sed -nE 's@^.*/releases/tag/v([0-9][0-9\.]*)".*$@\1@gp' | head -n 1
}
# To update package:
# source PKGBUILD && pkgvernew=$(_update_pkg)  && [[ $pkgvernew != $pkgver ]]  && sed -i "s/^pkgver=.*/pkgver=$pkgvernew/" PKGBUILD && updpkgsums && makepkg && makepkg --printsrcinfo > .SRCINFO && git commit -m "update to ${pkgvernew}" .SRCINFO PKGBUILD
