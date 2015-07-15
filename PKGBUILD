#Maintainer: Dmytro Aleksandrov <alkersan@gmail.com>

pkgname=docker-compose-bin
pkgver=1.3.2
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
sha256sums=('7a5ae383ce760b400215871e2dff970308649727415b52045fb1c32767722869'
            '61e26f9eaed839d2df69f85579239afd2d305b7c2d10bb96b03d8b92b4690d72')

package() {
  cd $srcdir
  install -Dm755 docker-compose-Linux-x86_64 $pkgdir/usr/bin/docker-compose
  ln -s docker-compose $pkgdir/usr/bin/fig

  cd $srcdir/compose-$pkgver
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 contrib/completion/bash/docker-compose $pkgdir/etc/bash_completion.d/docker-compose
  install -Dm644 contrib/completion/zsh/_docker-compose $pkgdir/usr/share/zsh/site-functions/_docker-compose
}
