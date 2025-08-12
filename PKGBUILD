# Maintainer teuto.net <aur@teuto.net>

pkgname=k9s-flux
pkgver=1.0.0
pkgrel=2
pkgdesc="A k9s plugin which provides basic flux commands."
license=('APACHE')
arch=('x86_64')
depends=('kubectl' 'k9s' 'fluxcd')
source=("$pkgname-plugins.yaml")
sha512sums=('495f82e39dda1179631bb66d8ce8f7f9f96e509c6ad3b577411f261183e16ce7ec1078999063cc2980d0abaad8034362e2feafad2f88a0ec3556736cd7ddfa66')

package() {

  yaml=$srcdir/$source

  for plugin in $(cat $yaml | yq -er '.plugins | keys | join(" ")'); do
    cat $yaml | yq -Y .plugins.\"$plugin\" > $srcdir/$plugin.yaml
    install -D -m 0755 -t $pkgdir/usr/share/k9s/plugins $srcdir/$plugin.yaml
  done

}

#vim: syntax=sh
