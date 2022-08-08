# Maintainer: Sergii Fesenko <sergii underscore f dot at outlook dot com>
# Contributor: Dmytro Aleksandrov <alkersan@gmail.com>

pkgname=docker-compose-v1-bin
pkgver=1.29.2
pkgrel=1
pkgdesc="Pythonless package of a a tool for defining and running multi-container applications"
depends=('docker')
arch=('x86_64')
conflicts=('docker-compose')
provides=('docker-compose')
options=(!strip)
source=(
  "docker-compose-$pkgver::https://github.com/docker/compose/releases/download/$pkgver/docker-compose-Linux-x86_64"
  "https://github.com/docker/compose/archive/$pkgver.tar.gz"
)
url="https://github.com/docker/compose"
license=("Apache")
sha256sums=('f3f10cf3dbb8107e9ba2ea5f23c1d2159ff7321d16f0a23051d68d8e2547b323'
            '99a9b91d476062d280c889ae4e9993d7dd6a186327bafb2bb39521f9351b96eb')

package() {
  cd "$srcdir"
  install -Dm755 "docker-compose-$pkgver" "$pkgdir/usr/bin/docker-compose"

  cd "$srcdir/compose-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 contrib/completion/bash/docker-compose "$pkgdir/etc/bash_completion.d/docker-compose"
  install -Dm644 contrib/completion/zsh/_docker-compose "$pkgdir/usr/share/zsh/site-functions/_docker-compose"
}
