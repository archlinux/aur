# Maintainer: SovietReimu1228 <reimu@hakurei.win>

pkgname=sudo-rs-symlink
pkgver=0.2.7
pkgrel=2
pkgdesc='(Avoid if app supports PATH) swap sudo with -rs'
arch=(any)
url="https://github.com/trifectatechfoundation/sudo-rs"
license=('Apache-2.0 AND MIT')
depends=(sudo-rs)
provides=(sudo)
conflicts=(sudo)
source=("https://gitlab.archlinux.org/archlinux/packaging/packages/sudo/-/raw/main/sudo.pam"
sudoers-rs)
sha512sums=('SKIP'
            'd052030d282d64f7db0ca7948d066dc8898677bbf30c554b0d718a6dce295b47a7878f623ee333b1b469fda44707d33ead3dd69b3c56a689273b3508c202ae83')
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
