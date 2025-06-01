pkgname=sudo-rs-symlink
pkgver=0.2.6
pkgrel=3
pkgdesc="(Dangerous) Swap sudo with sudo-rs"
arch=(any)
url="https://github.com/trifectatechfoundation/sudo-rs"
license=('Apache-2.0 AND MIT')
depends=(sudo-rs)
backup=('etc/sudoers') # correct?
provides=(sudo)
conflicts=(sudo)
source=("https://gitlab.archlinux.org/archlinux/packaging/packages/sudo/-/raw/main/sudo.pam"
sudoers)
sha256sums=('d1738818070684a5d2c9b26224906aad69a4fea77aabd960fc2675aee2df1fa2'
            'a17090feee1f91b1205074dc1c542957a08dca7f432bbaa43586b6e70f0858fd')
package (){
	install -Dm644 sudo.pam "$pkgdir"/etc/pam.d/sudo
	install -Dm0440 sudoers "$pkgdir"/etc/sudoers
	install -d "$pkgdir"/usr/{bin,share/man/man8}
	ln -svf /usr/bin/visudo-rs "$pkgdir"/usr/bin/visudo
	ln -svf /usr/bin/sudo-rs "$pkgdir"/usr/bin/sudo
	ln -svf /usr/share/man/man8/sudo-rs.8.gz "$pkgdir"/usr/share/man/man8/sudo.8.gz
	ln -svf /usr/share/man/man8/visudo-rs.8.gz "$pkgdir"/usr/share/man/man8/visudo.8.gz
}
