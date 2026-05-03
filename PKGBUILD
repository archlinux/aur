# Maintainer: openZro <dev@openzro.io>
#
# This file is a template — the release-binaries.yml workflow rewrites
# `0.53.1.alpha.34`, `0.53.1-alpha.34`, and the two `__SHA256_<arch>__` markers
# below at tag-publish time, then pushes the resulting PKGBUILD to
# https://aur.archlinux.org/openzro-bin.git via the
# KSXGitHub/github-actions-deploy-aur action.
#
# AUR pkgver cannot contain hyphens, so a tag like `v0.53.1-alpha.1`
# becomes pkgver `0.53.1.alpha.1` while _realver keeps the original
# spelling for the GitHub Release URL.
pkgname=openzro-bin
_pkgname=openzro
pkgver=0.53.1.alpha.34
_realver=0.53.1-alpha.34
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
sha256sums_x86_64=('5050c5a024cb51d834def8a9e55238883d9213316e8fbdb19e754252250376e3')
sha256sums_aarch64=('8ddc1c6da1abfbe114f0a81c6978ad92a67022b4aaba1c75530d9ac973dcde61')

package() {
    install -Dm0755 "$srcdir/openzro" "$pkgdir/usr/bin/openzro"
    install -Dm0644 "$srcdir/LICENSE"   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
