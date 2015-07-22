#Maintainer: Dmytro Aleksandrov <alkersan@gmail.com>

pkgname=docker-compose-bin
pkgver=1.3.3
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
url="https://www.docker.com/"
license="Apache"
sha256sums=('97ce4770d4857731d952af492800f2fcc3199e8c40b146b994ca48a912e0450c'
            '9cf4f02f897ff2f0df6e46e3d46f9f91271856cc52680928d916b0d4c969218f')

package() {
  cd $srcdir
  install -Dm755 docker-compose-Linux-x86_64 $pkgdir/usr/bin/docker-compose
  ln -s docker-compose $pkgdir/usr/bin/fig

  cd $srcdir/compose-$pkgver
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 contrib/completion/bash/docker-compose $pkgdir/etc/bash_completion.d/docker-compose
  install -Dm644 contrib/completion/zsh/_docker-compose $pkgdir/usr/share/zsh/site-functions/_docker-compose
}
