# Maintainer teuto.net <aur@teuto.net>

pkgname=k9s-openstack
pkgver=1.1.0
pkgrel=2
pkgdesc="A k9s plugin which sets environment variables in the current terminal session to allow faster access to openstack projects."
license=('APACHE')
arch=('x86_64')
depends=('kubectl' 'yq' 'k9s' 'capo-shell')
source=("$pkgname-plugins.yaml")
sha512sums=('cd845e1a97d89a492c76ba4f22e1bac9febd595487ce68bc6e10b8f6f3c96d35484c1499ad10284601ae156af7d245638270a080d2770a8b82402ba07f253cf0')

package() {

  yaml=$srcdir/$source

  for plugin in $(cat $yaml | yq -er '.plugins | keys | join(" ")'); do
    cat $yaml | yq -Y .plugins.\"$plugin\" > $srcdir/$plugin.yaml
    install -D -m 0755 -t $pkgdir/usr/share/k9s/plugins $srcdir/$plugin.yaml
  done
  
}

#vim: syntax=sh

