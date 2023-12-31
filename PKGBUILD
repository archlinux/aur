# Maintainer: Nep_Nep <nepnep91 at child dot pizza>

pkgname=hyfetch-extra-git
pkgver=1.4.10.r78.g6932a9fb
pkgrel=1
pkgdesc="Neofetch with LGBTQ pride flags. (extra flags)"
arch=('any')
url='https://github.com/NepNep21/hyfetch-extra'
license=('MIT')
depends=('python' 'python-setuptools' 'python-typing_extensions')
makedepends=('git')
source=("$pkgname::git+$url")
md5sums=('SKIP')
provides=('hyfetch')
conflicts=('hyfetch' 'hyfetch-git')

prepare() {
  cd "$pkgname"
  git checkout extra
}

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname}
  chmod +x neofetch
  chmod +x hyfetch/scripts/neowofetch
  /usr/bin/python3 setup.py build
}

package() {
  cd ${pkgname}
  chmod +x neofetch
  chmod +x hyfetch/scripts/neowofetch
  /usr/bin/python3 setup.py install --root="$pkgdir" --optimize=1
}
