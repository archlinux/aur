#Maintainer: Dmytro Aleksandrov <alkersan@gmail.com>

pkgname=docker-compose-bin
pkgver=1.24.1
pkgrel=1
pkgdesc="Pythonless package of a a tool for defining and running multi-container applications"
depends=('docker')
arch=('x86_64')
conflicts=('docker-compose')
options=(!strip)
source=(
  "docker-compose-$pkgver::https://github.com/docker/compose/releases/download/$pkgver/docker-compose-Linux-x86_64"
  "https://github.com/docker/compose/archive/$pkgver.tar.gz"
)
url="https://github.com/docker/compose"
license=("Apache")
sha256sums=('cfb3439956216b1248308141f7193776fcf4b9c9b49cbbe2fb07885678e2bb8a'
            '63a0e0d3819ff77aebd3d5ea30f77b36475ed522c4dabed2eb10636e35aa9370')

package() {
  cd "$srcdir"
  install -Dm755 "docker-compose-$pkgver" "$pkgdir/usr/bin/docker-compose"

  cd "$srcdir/compose-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 contrib/completion/bash/docker-compose "$pkgdir/etc/bash_completion.d/docker-compose"
  install -Dm644 contrib/completion/zsh/_docker-compose "$pkgdir/usr/share/zsh/site-functions/_docker-compose"
}
