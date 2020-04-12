# Maintainer: Hao Long <aur@esd.cc>

pkgname=vxwireguard-generator-git
pkgver=r16.779f0a5
pkgrel=1
pkgdesc='Utility to generate VXLAN over Wireguard mesh SD-WAN configuration'
arch=('any')
url='https://github.com/m13253/VxWireguard-Generator'
license=('MIT')
provides=('vwgen')
conflicts=('vwgen')
depends=('python-pynacl'
         'python-setuptools'
         'python-toml')
makedepends=('git')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
