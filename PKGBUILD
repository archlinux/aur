# Maintainer: openZro <dev@openzro.io>
#
# This file is a template — the release-binaries.yml workflow rewrites
# `0.53.1.alpha.96`, `0.53.1-alpha.96`, and the two `__SHA256_<arch>__` markers
# below at tag-publish time, then pushes the resulting PKGBUILD to
# https://aur.archlinux.org/openzro-bin.git via the
# KSXGitHub/github-actions-deploy-aur action.
#
# AUR pkgver cannot contain hyphens, so a tag like `v0.53.1-alpha.1`
# becomes pkgver `0.53.1.alpha.1` while _realver keeps the original
# spelling for the GitHub Release URL.
pkgname=openzro-bin
_pkgname=openzro
pkgver=0.53.1.alpha.96
_realver=0.53.1-alpha.96
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
sha256sums_x86_64=('2b167085ad236e93a8fbc14fa01678be47230e733454fd1d06d1b12f79c81c57')
sha256sums_aarch64=('14b0533c1b83afbba590be484b103a94b9961acef6d442b3d70e7cfbd2524657')

package() {
    install -Dm0755 "$srcdir/openzro" "$pkgdir/usr/bin/openzro"
    install -Dm0644 "$srcdir/LICENSE"   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
