# Maintainer: TwoWells <mwellsa@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=lattice-markdown-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Markdown predicate linter and backlink reconciler, shipped as an LSP server (prebuilt binary)"
arch=('x86_64')
url="https://github.com/TwoWells/Lattice"
license=('AGPL-3.0-or-later')
depends=('gcc-libs')
provides=('lattice-markdown')
# The unrelated AUR packages `lattice` and `lattice-bin` also install a
# /usr/bin/lattice, so the file conflict is declared explicitly. The upstream
# project (and its binary) is plain `lattice`; the pkgname carries the
# -markdown suffix only because the AUR name is taken.
conflicts=('lattice-markdown' 'lattice' 'lattice-bin')
# Prebuilt binary is already stripped upstream; skip the (empty) debug split.
options=('!debug' '!strip')
_target="x86_64-unknown-linux-gnu"
# The release tarball ships only the `lattice` binary, so the AGPL LICENSE is
# fetched separately from the tagged tree.
source=("lattice-$pkgver-$_target.tar.gz::https://github.com/TwoWells/Lattice/releases/download/v$pkgver/lattice-$_target.tar.gz"
    "LICENSE-$pkgver::https://raw.githubusercontent.com/TwoWells/Lattice/v$pkgver/LICENSE")
sha256sums=('60155c84a3303b66f3991782ad5c9978b188237f9aca44b118c7a107ca6b9c32'
            '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')

package() {
    install -Dm755 "lattice" "$pkgdir/usr/bin/lattice"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
