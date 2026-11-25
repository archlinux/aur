# Maintainer: Carlos Castillo <cmcastillochacon91@gmail.com>
# Repacks the .deb published on GitHub Releases — identical binaries to every
# other channel. Version + checksums are bumped automatically by the
# publish-aur job in the repo's release workflow (updpkgsums).
pkgname=agent-console-bin
pkgver=0.99.1
pkgrel=1
pkgdesc="Direct coding agents in your repo, with a verifiable record of what they did"
arch=('x86_64')
url="https://github.com/cyl-castillo/agent-console"
license=('AGPL-3.0-only')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'alsa-lib' 'git')
optdepends=('nodejs: to run an agent CLI installed through npm (Codex, Claude Code)'
            'npm: to install one (npm i -g @anthropic-ai/claude-code, npm i -g @openai/codex)')
provides=('agent-console')
conflicts=('agent-console')
options=('!strip')
source=("$url/releases/download/v$pkgver/Agent.Console_${pkgver}_amd64.deb"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/cyl-castillo/agent-console/v$pkgver/LICENSE")
sha256sums=('c410791349b69dc073e532b2faef3fb67d6b9103188f07e254e4e4d1557a1c60'
            '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')

package() {
    # makepkg already unpacked the .deb (ar archive) into $srcdir; the payload
    # lives in data.tar.gz with usr/{bin,lib,share} layout — matches Arch.
    bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
    install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
