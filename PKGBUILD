# Maintainer: ftk

_pkgname='wireproxy-awg'
pkgname="${_pkgname}-bin"
pkgver=1.0.18
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
sha256sums_x86_64=('6b9c6d10308cfe8b593b694473ae1feba9f6d91e81db01ea4f9f6a03ec673084')
sha256sums_aarch64=('ee05ae8426b78947832c95c39596d5e778f4d485e8208683264c08064f82e7a3')
sha256sums_armv7h=('1830acaddd9dc0f82327444e43149d9c5c1942f3bad086255e36d54431817635')


package() {
    install -Dm755 "$srcdir/wireproxy" "$pkgdir/usr/bin/wireproxy"
}

_update_pkg() {
    curl -Ssf "${url}/releases.atom" | sed -nE 's@^.*/releases/tag/v([0-9][0-9\.]*)".*$@\1@gp' | head -n 1
}
# To update package:
# source PKGBUILD && pkgvernew=$(_update_pkg)  && [[ $pkgvernew != $pkgver ]]  && sed -i "s/^pkgver=.*/pkgver=$pkgvernew/" PKGBUILD && updpkgsums && makepkg && makepkg --printsrcinfo > .SRCINFO && git commit -m "update to ${pkgvernew}" .SRCINFO PKGBUILD
