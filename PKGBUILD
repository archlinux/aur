# Maintainer teuto.net <aur@teuto.net>

pkgname=k9s-openstack
pkgver=1.0.0
pkgrel=1
pkgdesc="A k9s plugin which sets environment variables in the current terminal session to allow faster access to openstack projects."
license=('APACHE')
arch=('x86_64')
depends=('kubectl' 'yq' 'k9s' 'openstack')
source=("$pkgname-plugins.yaml")
sha512sums=('56478041c71cbeaa4c6f641f6eebf53fc2e713272898af484fb5b23de2e678e4205bd818fa1854491aef6149517e724add0d7424ae765e43898c0cac6b6f9e89')

package() {

  yaml=$srcdir/$source

  for plugin in $(cat $yaml | yq -er '.plugins | keys | join(" ")'); do
    cat $yaml | yq -Y .plugins.\"$plugin\" > $srcdir/$plugin.yaml
    install -D -m 0755 -t $pkgdir/usr/share/k9s/plugins $srcdir/$plugin.yaml
  done
  
}

#vim: syntax=sh

