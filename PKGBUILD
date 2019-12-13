# Maintainer: TJ Hoplock <t.hoplock at gmail dot com>
pkgname=tmuxer-git
pkgver=2.1.0
pkgrel=1
pkgdesc="Tmux layout generator and command executor"
arch=('any')
url="https://github.com/tjhop/tmuxer"
license=('MIT')
depends=('bash' 'coreutils' 'sed' 'tmux')
makedepends=('git')
optdepends=('openssh')
provides=('tmuxer')
conflicts=('tmuxer')
source=("$pkgname::git+https://github.com/tjhop/${pkgname%-*}.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
    cd "$pkgname"
    install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 ./tmuxer "$pkgdir/usr/bin/tmuxer"
}
