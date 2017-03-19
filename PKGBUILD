# Contributor: Johannes Dewender  arch at JonnyJD dot net
pkgname=targetcli-fb
pkgver=2.1.fb46
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
sha512sums=('239b59c3c9367f6e35e3a207aa1d605c99bc28dad07ae9cda7ffb1a9a2c7fdcb388708882369f73c6fb188f33d1dd9e45b8684826f274a1a71b51dec9be487ed')


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
