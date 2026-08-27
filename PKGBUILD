# Maintainer teuto.net <aur@teuto.net>

pkgname=k9s-flux
pkgver=1.3.0
pkgrel=1
pkgdesc="A k9s plugin which provides basic flux commands."
license=('APACHE')
arch=('x86_64')
depends=('kubectl' 'k9s' 'fluxcd')
source=("$pkgname-plugins.yaml")
sha512sums=('658344ceb37ae005ceee274dff6d696ea14c623d2af8e257cc039c46916f2e6bdfae8a20b327fb49a4b0656570c41a16004ebabd2fd39961ba44354ee6df9579')

package() {

  yaml=$srcdir/$source

  for plugin in $(cat $yaml | yq -er '.plugins | keys | join(" ")'); do
    cat $yaml | yq -Y .plugins.\"$plugin\" > $srcdir/$plugin.yaml
    install -D -m 0755 -t $pkgdir/usr/share/k9s/plugins $srcdir/$plugin.yaml
  done

}

#vim: syntax=sh
