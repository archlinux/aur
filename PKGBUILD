pkgname=subuser
_name=subuser
pkgver=0.4
pkgrel=1
pkgdesc="Run programs in linux with selectively restricted permissions"
url="http://subuser.org"
depends=('python' 'docker')
makedepends=('python')
optdepends=()
license=('LGPL3')
arch=('any')
source=("https://github.com/subuser-security/${_name}/archive/${pkgver}.tar.gz")
sha256sums=('2b53a0be7f01dacc5a09d9e3f592578a38922e3a2f103142077fd05fa09cbafd')

package() {
  cd "$srcdir/${_name}-${pkgver}"

  # For now, nothing is built, the source directory is expected to be copied
  # somewhere (see http://subuser.org/installation.html#installation).
  # /opt/subuser is currently used, but this is likely to change.

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/subuser/logic/subuser" "$pkgdir/usr/bin/subuser"

  install -d -m 755 "$pkgdir/opt/subuser"
  install -D -m 644 *.json "$pkgdir/opt/subuser"

  # TODO: check permissions
  cp -dr --no-preserve='ownership' {logic,test} "$pkgdir/opt/subuser/"
  chmod -R 755 "$pkgdir/opt/subuser/"{logic,test}

  chmod +x "$pkgdir/opt/subuser/logic/subuser"
}
