# Maintainer: Logan Koester <logan@logankoester.com>
_npmname=vault-pki-client
_npmver=1.0.2
pkgname=vault-pki-client # All lowercase
pkgver=1.0.2
pkgrel=4
pkgdesc="Tool to manage a keypair provided by HashiCorp Vault"
arch=(any)
url="https://github.com/issacg/vault-pki-client#readme"
license=(Apache)
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(84e411e7b1fbcd2bd320b6a2b8d8d4b39394251b)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  local HOME=$pkgdir
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --user root --prefix "$pkgdir/usr" $_npmname@$_npmver
  install -D --mode=644 ${startdir}/config ${pkgdir}/etc/vault-pki-client/config
  install -D --mode=644 ${startdir}/vault-pki-client.service ${pkgdir}/usr/lib/systemd/system/vault-pki-client.service
}

# vim:set ts=2 sw=2 et:
