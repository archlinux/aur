# Contributor: Riadh Habbachi <habbachi.riadh at gmail dot com> 
# Maintainer: Riadh Habbachi <habbachi.riadh at gmail dot com> 
pkgname=butterfly
pkgver='r282.ec25edb'
pkgrel=1
pkgdesc="Butterfly is a xterm compatible terminal that runs in your browser."
url="https://github.com/paradoxxxzero/butterfly"
arch=('any')
license=('GPL')
groups=()
depends=('python' 'python-tornado' 'python-pyopenssl' 'tornado_systemd' 'python-libsass')
makedepends=('python-setuptools' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${pkgname%-*}"::"git://github.com/paradoxxxzero/butterfly.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgbase}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 0644 "${srcdir}/$pkgname/${pkgname}.service" \
    "$pkgdir/etc/systemd/system/${pkgname}.service"
}

# vim:set ts=2 sw=2 et:
