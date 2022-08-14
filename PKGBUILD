# Maintainer: Gerardo Gomez <gerardo.gomez@tutanota.com>

pkgname=docker-compose-v2-bin
pkgver=2.9.0
pkgrel=1
pkgdesc="Standalone Golang-based package of a tool for running multi-container applications on Docker defined using the Compose file format"
depends=()
arch=('x86_64')
conflicts=('docker-compose')
provides=('docker-compose')
options=(!strip)
source=(
  "docker-compose-v$pkgver::https://github.com/docker/compose/releases/download/v$pkgver/docker-compose-linux-x86_64"
  "https://github.com/docker/compose/archive/v$pkgver.tar.gz"
)
url="https://github.com/docker/compose"
license=("Apache")
sha256sums=('3be9ce88ecba41b734e3fc8e59a9b11531133761414a78827d1615aadb5ef1f5'
            '582f3dacb3e96e9a07ff3b9d137b508377a769309b84f6faa8722d7f5a226353')

package() {
  cd "$srcdir"
  install -Dm755 "docker-compose-v$pkgver" "$pkgdir/usr/bin/docker-compose"

  cd "$srcdir/compose-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # bash and zsh completion are missing, but there is a pending relevant PR: https://github.com/docker/compose/pull/9620/files
  # install -Dm644 contrib/completion/bash/docker-compose "$pkgdir/etc/bash_completion.d/docker-compose"
  # install -Dm644 contrib/completion/zsh/_docker-compose "$pkgdir/usr/share/zsh/site-functions/_docker-compose"
}
