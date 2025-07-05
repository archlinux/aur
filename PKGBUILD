pkgname=sudo-rs-symlink
pkgver=0.2.7
pkgrel=1
pkgdesc='(Avoid if app supports PATH) swap sudo with -rs'
arch=(any)
url="https://github.com/trifectatechfoundation/sudo-rs"
license=('Apache-2.0 AND MIT')
depends=(sudo-rs)
provides=(sudo)
conflicts=(sudo)
source=("https://gitlab.archlinux.org/archlinux/packaging/packages/sudo/-/raw/main/sudo.pam"
sudoers-rs)
sha256sums=('d1738818070684a5d2c9b26224906aad69a4fea77aabd960fc2675aee2df1fa2'
            'a17090feee1f91b1205074dc1c542957a08dca7f432bbaa43586b6e70f0858fd')
package (){
  install -Dm644 sudo.pam "$pkgdir"/etc/pam.d/sudo
  ln -sf /etc/pam.d/sudo "$pkgdir"/etc/pam.d/sudo-i
  install -Dm0440 sudoers-rs "$pkgdir"/etc/sudoers-rs
  install -d "$pkgdir"/etc/sudoers.d # remove warning
  install -d "$pkgdir"/usr/{bin,share/man/man8}
  ln -sf /usr/bin/visudo-rs "$pkgdir"/usr/bin/visudo
  ln -sf /usr/bin/sudo-rs "$pkgdir"/usr/bin/sudo
  ln -sf /usr/share/man/man8/sudo-rs.8.gz "$pkgdir"/usr/share/man/man8/sudo.8.gz
  ln -sf /usr/share/man/man8/visudo-rs.8.gz "$pkgdir"/usr/share/man/man8/visudo.8.gz
  echo 'Avoid using this if your application supports config or PATH'
}
