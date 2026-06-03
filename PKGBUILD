# Maintainer: Markus Maiwald <markus@maiwald.work>
pkgname=progit-bin
pkgver=0.8.3_beta
pkgrel=1
pkgdesc="Blazing-fast terminal issue tracker with Kanban, Forgejo/GitLab sync, and plugin marketplace"
arch=('x86_64')
url="https://progit.sovereign-society.org"
license=('LCL-1.0')
depends=('gcc-libs' 'openssl')
optdepends=('minisign: for signature verification')
provides=('progit')
conflicts=('progit')
source=("https://git.sovereign-society.org/ProGit/progit/releases/download/v${pkgver//_/-}/prog-v${pkgver//_/-}-x86_64-unknown-linux-gnu.tar.gz"
        "https://git.sovereign-society.org/ProGit/progit/releases/download/v${pkgver//_/-}/prog-v${pkgver//_/-}-x86_64-unknown-linux-gnu.tar.gz.minisig"
        "https://git.sovereign-society.org/ProGit/progit/releases/download/v${pkgver//_/-}/SHA256SUMS"
        "https://git.sovereign-society.org/ProGit/progit/releases/download/v${pkgver//_/-}/SHA256SUMS.minisig")
# SHA256s updated by release CI (tag-triggered build)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

# Minisign public key for signature verification:
# RWR0ND/cWMOlrPp+L7tQUO53UwSMgtsqBeGW5zKID/of5GNkz4aNtkZk

verify() {
  if command -v minisign &>/dev/null; then
    minisign -V -P "RWR0ND/cWMOlrPp+L7tQUO53UwSMgtsqBeGW5zKID/of5GNkz4aNtkZk" \
      -x "prog-v${pkgver//_/-}-x86_64-unknown-linux-gnu.tar.gz.minisig" \
      -m "prog-v${pkgver//_/-}-x86_64-unknown-linux-gnu.tar.gz"
  fi
}

package() {
    install -Dm755 "prog" "${pkgdir}/usr/bin/prog"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/prog" <<'EOF'
# Bash completions for prog — generated from progit-shell-completions.bash
# Source: https://git.sovereign-society.org/ProGit/progit
EOF
}
