# Maintainer: Jonne Haß <me@jhass.eu>
pkgname=nginx_ensite-git
pkgver=0.56.fa4d72c
pkgrel=1
pkgdesc="enable/disable an nginx site/virtual host"
arch=('any')
url="http://github.perusio.org/nginx_ensite/"
license=('MIT')
makedepends=('git')
depends=('nginx')
source=("$pkgname::git://github.com/perusio/nginx_ensite.git")
install='nginx_ensite.install'

pkgver () {
  cd "$srcdir"/$pkgname
  echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

prepare() {  
  cd "$srcdir"/$pkgname
  sed -i "s/STARTUP_PROGRAM_NAME=\$(get_startup_program_name service)/STARTUP_PROGRAM_NAME=\$(get_startup_program_name systemctl reload nginx)/" bin/nginx_ensite
}

package() {
  cd "$srcdir"/$pkgname

  install -Dm755 bin/nginx_ensite               "$pkgdir"/usr/bin/nginx_ensite
  install -Dm755 bin/nginx_dissite              "$pkgdir"/usr/bin/nginx_dissite
  install -Dm644 share/man/man8/nginx_ensite.8  "$pkgdir"/usr/share/man/man8/nginx_ensite.8
  install -Dm644 share/man/man8/nginx_dissite.8 "$pkgdir"/usr/share/man/man8/nginx_dissite.8
  install -Dm644 bash_completion.d/nginx_ensite "$pkgdir"/etc/bash_completion.d/nginx_ensite
  mkdir -p "$pkgdir"/etc/nginx/sites-available
  mkdir -p "$pkgdir"/etc/nginx/sites-enabled
}

# vim:set ts=2 sw=2 et:
sha256sums=('SKIP')
