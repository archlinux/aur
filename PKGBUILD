#Maintainer: Dmytro Aleksandrov <alkersan@gmail.com>

pkgname=docker-compose-bin
pkgver=1.25.3
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
sha256sums=('b3835d30f66bd3b926511974138923713a253d634315479b9aa3166c0050da98'
            'c294f71baab825b787b8c66a1e03c4631ed6813fee4e3b3b8a48fc65c7314ecb')

package() {
  cd "$srcdir"
  install -Dm755 "docker-compose-$pkgver" "$pkgdir/usr/bin/docker-compose"

  cd "$srcdir/compose-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 contrib/completion/bash/docker-compose "$pkgdir/etc/bash_completion.d/docker-compose"
  install -Dm644 contrib/completion/zsh/_docker-compose "$pkgdir/usr/share/zsh/site-functions/_docker-compose"
}
