#Maintainer: Dmytro Aleksandrov <alkersan@gmail.com>

pkgname=docker-compose-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="Pythonless package of a fast, isolated development environments using Docker"
depends=('docker')
arch=('x86_64')
conflicts=('docker-compose')
options=(!strip)
source=(
  "https://github.com/docker/compose/releases/download/$pkgver/docker-compose-Linux-x86_64"
  "https://github.com/docker/compose/archive/$pkgver.tar.gz"
)
url="https://github.com/docker/compose"
license=("Apache")
sha256sums=('a748a107dd0c6146e7f8a40f9d0fde29e19b3e8234d2de7e522a1fea15048e70'
            'a1e6cbe11b5612196dd8324d4cd5a33fda1a6ea99e1bca47cd7e0ab85020480e')

package() {
  cd "$srcdir"
  install -Dm755 docker-compose-Linux-x86_64 "$pkgdir/usr/bin/docker-compose"

  cd "$srcdir/compose-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 contrib/completion/bash/docker-compose "$pkgdir/etc/bash_completion.d/docker-compose"
  install -Dm644 contrib/completion/zsh/_docker-compose "$pkgdir/usr/share/zsh/site-functions/_docker-compose"
}
