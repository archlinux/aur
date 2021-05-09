# Maintainer: Felipe Contreras <felipe.contreras@gmail.com>

pkgorig=profile-sync-daemon
pkgname=$pkgorig-user
pkgver=6.44
pkgrel=1
pkgdesc="Symlinks and syncs browser profile dirs to RAM (user fork)"
arch=('any')
url="https://github.com/Xervon/profile-sync-daemon"
license=('MIT')
depends=('bash' 'findutils' 'inetutils' 'procps-ng' 'rsync' 'systemd')
optdepends=('zsh-completions: for completion when using zsh')
install="$pkgname.install"
source=("$pkgname::git+$url.git#branch=master")
sha512sums=('SKIP')

provides=("$pkgorig=$pkgver")
conflicts=($pkgorig)

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir/" install
  install -vDm 644 MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# shellcheck disable=SC2034
