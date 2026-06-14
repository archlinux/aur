# Maintainer: skint007 <archlinux.repose742@passmail.net>
pkgname=sshfsm
pkgver=2.4.0
pkgrel=1
pkgdesc="SSH File System Mount Manager - simplified bash script for mounting remote servers using sshfs"
arch=('any')
url="https://github.com/skint007/sshfsm"
license=('MIT')
depends=('bash' 'sshfs' 'jq' 'fuse2')
optdepends=('openssh: for SSH connections')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')
# 'SKIP' is replaced with a real checksum by the CI workflow (updpkgsums) on
# release. To set it manually, run `updpkgsums` in this directory after tagging.

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Main script (provides the `sshm` command)
    install -Dm755 sshm "$pkgdir/usr/bin/sshm"

    # Bash completion
    install -Dm644 sshm-completion.bash "$pkgdir/usr/share/bash-completion/completions/sshm"

    # Zsh completion
    install -Dm644 sshm-completion.zsh "$pkgdir/usr/share/zsh/site-functions/_sshm"

    # Documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
