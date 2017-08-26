# Contributor: Johannes Dewender  arch at JonnyJD dot net
pkgname=targetcli-fb
pkgver=2.1.fb47
pkgrel=1
pkgdesc="free branch of the targetcli LIO administration shell (iSCSI + Co)"
arch=('any')
url="https://github.com/open-iscsi/targetcli-fb"
license=('Apache')
groups=()
depends=('python-rtslib-fb>=2.1.fb52' 'python-configshell-fb>=1.1.fb17'
         'python-dbus')
makedepends=('python-setuptools')
optdepends=('python-ethtool')
provides=('targetcli')
backup=()
options=()
install=
source=(https://github.com/open-iscsi/targetcli-fb/archive/v${pkgver}.tar.gz)
sha512sums=('1b0ed2730cce7d4ec9b0b9d7d4d5cfe6836dae16824859730d8ef5f61ad31ca4a5a25abd2a54af93ae7611715918683538dadfa885a80b4591cc23a60b44d08d')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
  gzip --stdout targetcli.8 > "targetcli.8.gz"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --skip-build --root="$pkgdir/" --optimize=1

  install -D -m 644 targetcli.8.gz "$pkgdir/usr/share/man/man8/targetcli.8.gz"
}

# vim:set ts=2 sw=2 et:
