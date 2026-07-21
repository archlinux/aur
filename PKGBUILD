# Maintainer: Markus Maiwald <markus@maiwald.work>
# Contributor: Virgil, Primus of Libertaria
pkgname=progit-bin
pkgver=0.8.4_beta
pkgrel=1
pkgdesc="Git-First Project Management — blazing-fast terminal issue tracker with Kanban, Forgejo/GitLab sync, and plugin marketplace"
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
sha256sums=('89c87bbfde7997b8afc1fbd682bac7071f7f6d52b64eff34fa0bd4a8f952568d'
            'SKIP'
            '0f7a550ab9aafaa1cb10ff7f6a24d9e00dd92b286ef5d91cca7696597258f0f1'
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
