#Maintainer: Dmytro Aleksandrov <alkersan@gmail.com>

pkgname=docker-compose-bin
pkgver=1.25.2
pkgrel=1
pkgdesc="Pythonless package of a a tool for defining and running multi-container applications"
depends=('docker')
arch=('x86_64')
conflicts=('docker-compose')
options=(!strip)
source=(
  "docker-compose-$pkgver::https://github.com/docker/compose/releases/download/v$pkgver/docker-compose-Linux-x86_64"
  "$pkgver.tar.gz::https://github.com/docker/compose/archive/v$pkgver.tar.gz"
)
url="https://github.com/docker/compose"
license=("Apache")
sha256sums=('786f9390aa8d72bcf34a1757df71577b7d8b7cb915205f72f12b9ee3ca0e0cc6'
            'c74550785929b319e8ec2771442041b4f77aad7eb54437c10d9f43b92d619f23')

package() {
  cd "$srcdir"
  install -Dm755 "docker-compose-$pkgver" "$pkgdir/usr/bin/docker-compose"

  cd "$srcdir/compose-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 contrib/completion/bash/docker-compose "$pkgdir/etc/bash_completion.d/docker-compose"
  install -Dm644 contrib/completion/zsh/_docker-compose "$pkgdir/usr/share/zsh/site-functions/_docker-compose"
}
