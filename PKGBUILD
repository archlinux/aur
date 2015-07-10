#Maintainer: Dmytro Aleksandrov <alkersan@gmail.com>

pkgname=docker-compose-bin
pkgver=1.3.1
pkgrel=2
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
sha256sums=('1ceb5fd0d43bc7ae33eb9c78779e43ed89b4dba16375bbce09c8dce770c7d73d'
            '04b60b805dc305543d5fe9a0880b8e1ad5818c440587a26b0eb01f9e3e8e79eb')

package() {
  cd $srcdir
  install -Dm755 docker-compose-Linux-x86_64 $pkgdir/usr/bin/docker-compose
  ln -s docker-compose $pkgdir/usr/bin/fig

  cd $srcdir/compose-$pkgver
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 contrib/completion/bash/docker-compose $pkgdir/etc/bash_completion.d/docker-compose
  install -Dm644 contrib/completion/zsh/_docker-compose $pkgdir/usr/share/zsh/site-functions/_docker-compose
}