# Maintainer: Taijian <taijian@posteo.de>
# Contributor: Malstrond <malstrond@gmail.com>
# Contributor: xduugu

pkgname=dyndnsc-git
_pkgbase=python-dyndnsc
pkgver=0.5.1.r24.g59ef5f9
pkgrel=1
pkgdesc="Dynamic DNS client with support for multiple protocols and services. Compatible with IPv6 dual stack. Git version"
arch=('any')
url="https://pypi.org/project/dyndnsc"
license=('MIT')
depends=('python-requests' 'python-setuptools' 'python-netifaces' 'python-dnspython' 'python-daemonocle')
makedepends=('git')
provides=('dyndnsc')
conflicts=('dyndnsc')
source=("git+https://github.com/infothrill/python-dyndnsc.git"
        'dyndnsc.service')
md5sums=('SKIP'
         '530304e7ce3c6463c0d0d053949ad5a9')

pkgver() {
  cd "$_pkgbase"
  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

build() {
    cd "$_pkgbase"
    python setup.py build
}

package() {
    cd "$_pkgbase"
    python setup.py install --root="$pkgdir" --optimize=1

    # install systemd service file
    install -Dm644 "$srcdir/dyndnsc.service" "$pkgdir/usr/lib/systemd/system/dyndnsc.service"

    # install license file
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
