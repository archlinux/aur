# Maintainer teuto.net <aur@teuto.net>

pkgname=k9s-flux
pkgver=1.2.0
pkgrel=1
pkgdesc="A k9s plugin which provides basic flux commands."
license=('APACHE')
arch=('x86_64')
depends=('kubectl' 'k9s' 'fluxcd')
source=("$pkgname-plugins.yaml")
sha512sums=('0e150b752f57991625fc15d9b45cec05365beb32bc549ffe3f74e86a603d599b8effe86041600df50e341e30fbc4871eaa0035ded179331c2b0570bb8e7f88a6')

package() {

  yaml=$srcdir/$source

  for plugin in $(cat $yaml | yq -er '.plugins | keys | join(" ")'); do
    cat $yaml | yq -Y .plugins.\"$plugin\" > $srcdir/$plugin.yaml
    install -D -m 0755 -t $pkgdir/usr/share/k9s/plugins $srcdir/$plugin.yaml
  done

}

#vim: syntax=sh
