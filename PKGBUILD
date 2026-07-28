# Maintainer: Carlos Castillo <cmcastillochacon91@gmail.com>
# Repacks the .deb published on GitHub Releases — identical binaries to every
# other channel. Version + checksums are bumped automatically by the
# publish-aur job in the repo's release workflow (updpkgsums).
pkgname=agent-console-bin
pkgver=0.65.0
pkgrel=1
pkgdesc="Minimalist AI-native console for directing coding agents inside a repository"
arch=('x86_64')
url="https://github.com/cyl-castillo/agent-console"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'alsa-lib' 'nodejs' 'git')
optdepends=('npm: to install the Claude Code CLI (npm i -g @anthropic-ai/claude-code)')
provides=('agent-console')
conflicts=('agent-console')
options=('!strip')
source=("$url/releases/download/v$pkgver/Agent.Console_${pkgver}_amd64.deb"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/cyl-castillo/agent-console/v$pkgver/LICENSE")
sha256sums=('c3b9a6210fae9f25955e2b5b4551b0071712e65592005cfd705bdc637599e5cb'
            'bdf1d8fe99335432f1cf4e9bf20da2795f3bdb11f72f84e2a2edb5037664ad8e')

package() {
    # makepkg already unpacked the .deb (ar archive) into $srcdir; the payload
    # lives in data.tar.gz with usr/{bin,lib,share} layout — matches Arch.
    bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
    install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
