# Maintainer: Markus Maiwald <markus@maiwald.work>
# Contributor: Virgil, Primus of Libertaria
pkgname=progit-bin
pkgver=0.10.0_beta
pkgrel=1
pkgdesc="Agent-first work ledger — JSON CLI for agents, status/board/ui for managers, local-first issues"
arch=('x86_64')
url="https://progit.dev"
license=('LicenseRef-LCL-1.0')
depends=('gcc-libs' 'openssl')
optdepends=('minisign: for signature verification')
provides=('progit')
conflicts=('progit')
source=("https://git.sovereign-society.org/ProGit/progit/releases/download/v${pkgver/_/-}/prog-${pkgver/_/-}-x86_64-unknown-linux-gnu.tar.gz"
        "https://git.sovereign-society.org/ProGit/progit/releases/download/v${pkgver/_/-}/prog-${pkgver/_/-}-x86_64-unknown-linux-gnu.tar.gz.minisig"
        "https://git.sovereign-society.org/ProGit/progit/releases/download/v${pkgver/_/-}/SHA256SUMS"
        "https://git.sovereign-society.org/ProGit/progit/releases/download/v${pkgver/_/-}/SHA256SUMS.minisig")
sha256sums=('2999cd8cdc5126eeca68c7dc8e1324a712f2db2c6fda9904bf77fcb4582e890c'
            'SKIP'
            '594836fa336d6743e0c3aad1775f3c9baacfe0dbdd81445b95b3405afdcfc008'
            'SKIP')

# Minisign public key for signature verification:
# RWR0ND/cWMOlrPp+L7tQUO53UwSMgtsqBeGW5zKID/of5GNkz4aNtkZk

validpgpkeys=('RWR0ND/cWMOlrPp+L7tQUO53UwSMgtsqBeGW5zKID/of5GNkz4aNtkZk')

verify() {
  if command -v minisign &>/dev/null; then
    minisign -V -P "RWR0ND/cWMOlrPp+L7tQUO53UwSMgtsqBeGW5zKID/of5GNkz4aNtkZk" \
      -x "prog-${pkgver/_/-}-x86_64-unknown-linux-gnu.tar.gz.minisig" \
      -m "prog-${pkgver/_/-}-x86_64-unknown-linux-gnu.tar.gz"
    minisign -V -P "RWR0ND/cWMOlrPp+L7tQUO53UwSMgtsqBeGW5zKID/of5GNkz4aNtkZk" \
      -x SHA256SUMS.minisig -m SHA256SUMS
  fi
}

package() {
    install -Dm755 "prog" "${pkgdir}/usr/bin/prog"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/prog" <<'EOF'
# Bash completions for prog — generated from progit-shell-completions.bash
# Source: https://git.sovereign-society.org/ProGit/progit
EOF
}
