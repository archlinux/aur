# Maintainer: lmartinez-mirror
pkgname=fish-ssh-agent-git
pkgver=r26.fd70a2a
pkgrel=1
pkgdesc="Fish plugin to automatically start ssh-agent"
arch=('any')
url="https://github.com/danhper/fish-ssh-agent"
license=('unknown')
groups=('fish-plugins')
depends=('fish' 'openssh')
makedepends=('git')
provides=('fish-ssh-agent')
conflicts=('fish-ssh-agent')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  find conf.d functions \
    -type f -exec install -Dm 644 '{}' "$pkgdir/etc/fish/{}" \;
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
