# Maintainer: Victrid <weihau.chiang@gmail.com>
pkgname=python-ryu-git
pkgver=4.34.r95.g537f35f4
pkgrel=1
pkgdesc="Component-based Software-defined Networking Framework"
arch=('any')
url="https://ryu-sdn.org"
license=('APACHE')
depends=('python' 'python-eventlet' 'python-msgpack' 'python-netaddr' 'python-oslo-config' 'openvswitch' 'python-packaging' 'python-routes' 'python-six' 'python-tinyrpc' 'python-webob')
makedepends=('git' 'python-setuptools' 'python-pip')
source=("$pkgname::git+https://github.com/faucetsdn/ryu.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/$pkgname"
  if git describe --long --tags >/dev/null 2>&1; then
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
    fi
}

build() {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1
    
    #Fix the strange /usr/etc
    mv "$pkgdir/usr/etc" "$pkgdir/etc"
}

# vim:set ts=2 sw=2 et:
 
