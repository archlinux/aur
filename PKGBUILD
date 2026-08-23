# Maintainer: Amurru Zerouk <amurru@users.noreply.github.com>
#
# Prebuilt-binary package (-bin): installs the linux/amd64 hakase binary
# published on GitHub releases by .github/workflows/release.yml. No
# compilation happens here; checksums pin the released assets.
#
# The release workflow uploads only the binary + SHA256SUMS.txt (+ SLSA
# provenance), so config.json.example and LICENSE are pulled from the tag.
#
# Update pkgver + sha256sums together (`updpkgsums` after editing pkgver).
# The sum for the binary is also in SHA256SUMS.txt on the release; the
# release additionally carries SLSA L3 provenance verifiable with
# slsa-verifier (see "Verifying release binaries" in README.md).

pkgname=hakase-bin
pkgver=0.1.0.alpha.3
pkgrel=1
pkgdesc="Go agent harness with an embedded Vue 3 web UI (prebuilt binary)"
arch=('x86_64')
url="https://github.com/amurru/hakase"
license=('MIT')
depends=('python')   # agent executes learned skills via python3
optdepends=('tectonic: latex-math skill (LaTeX rendering)'
            'poppler: PDF tools used by document skills'
            'librsvg: SVG conversion used by diagram skills'
            'inkscape: alternative SVG conversion'
            'wl-clipboard: clipboard support on Wayland'
            'xclip: clipboard support on X11')
provides=(hakase)
conflicts=(hakase)
# The real git tag. AUR pkgver cannot contain '-', so the alpha separator
# becomes a dot in pkgver; keep this in sync manually on version bumps.
_tag="v0.1.0-alpha.3"
source=("hakase-$_tag-linux-amd64::$url/releases/download/$_tag/hakase-$_tag-linux-amd64"
        "config.json.example::$url/raw/$_tag/config.json.example"
        "LICENSE::$url/raw/$_tag/LICENSE")
sha256sums=('07081a1aa2db039bda3e19cb9c5f91ee33820ee20c2f21613af758f69bb9365e'
            '555082141ff6038ac4c6700398b8b7727895c2d0fe243b768885439ea36c8667'
            '791adc82735316a6a2ca21ce16cf6f030ad640a8a2fdcc1f388c33816272131e')

package() {
  install -Dm755 "hakase-$_tag-linux-amd64" "$pkgdir/usr/bin/hakase"
  install -Dm644 config.json.example "$pkgdir/usr/share/doc/hakase/config.json.example"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/hakase/LICENSE"
}
