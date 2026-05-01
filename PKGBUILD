# Maintainer: openZro <dev@openzro.io>
#
# This file is a template — the release-binaries.yml workflow rewrites
# `0.53.1.alpha.21`, `0.53.1-alpha.21`, and the two `__SHA256_<arch>__` markers
# below at tag-publish time, then pushes the resulting PKGBUILD to
# https://aur.archlinux.org/openzro-bin.git via the
# KSXGitHub/github-actions-deploy-aur action.
#
# AUR pkgver cannot contain hyphens, so a tag like `v0.53.1-alpha.1`
# becomes pkgver `0.53.1.alpha.1` while _realver keeps the original
# spelling for the GitHub Release URL.
pkgname=openzro-bin
_pkgname=openzro
pkgver=0.53.1.alpha.21
_realver=0.53.1-alpha.21
pkgrel=1
pkgdesc="openZro client — zero-trust mesh networking (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://openzro.io"
license=('BSD-3-Clause')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('iptables' 'ca-certificates')
optdepends=('wireguard-tools: kernel WireGuard interface management')
source_x86_64=("openzro-${_realver}-x86_64.tar.gz::https://github.com/openzro/openzro/releases/download/v${_realver}/openzro_${_realver}_linux_amd64.tar.gz")
source_aarch64=("openzro-${_realver}-aarch64.tar.gz::https://github.com/openzro/openzro/releases/download/v${_realver}/openzro_${_realver}_linux_arm64.tar.gz")
sha256sums_x86_64=('73334c6f44c30c5a08bfdc23cfc44f53fbf3863eff69466675b0f3fe9b3e72dc')
sha256sums_aarch64=('f5a4c1bb7930f3335670686589de05af7c588e02d9e360cba0bea49de1792f17')

package() {
    install -Dm0755 "$srcdir/openzro" "$pkgdir/usr/bin/openzro"
    install -Dm0644 "$srcdir/LICENSE"   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
