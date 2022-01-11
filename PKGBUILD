# Maintainer: Hao Long <aur@esd.cc>

pkgname=wafw00f-git
pkgver=2.1.0.r2.g74b8c75
pkgrel=2
pkgdesc="The Web Application Firewall Fingerprinting Tool"
arch=("any")
url="https://github.com/EnableSecurity/wafw00f"
license=('BSD')
provides=('wafw00f')
conflicts=('wafw00f')
depends=("python-pluginbase"
         "python-requests")
makedepends=('python-setuptools' 'git')
source=("$pkgname::git+https://github.com/EnableSecurity/wafw00f.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  python setup.py build
}

package() {
  cd $pkgname
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

