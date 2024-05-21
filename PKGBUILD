# Maintainer: J. Corvera <jaida at jcorvera dot me>

pkgname=hyfetch-extra-legal-git
pkgver=v1.4.15
pkgrel=1
pkgdesc="Neofetch with LGBTQ pride flags. (extra flags, sans paedophelic)"
arch=('any')
url='https://github.com/naviabbot/hyfetch-extra'
license=('MIT')
depends=('python' 'python-setuptools' 'python-typing_extensions')
makedepends=('git')
source=("$pkgname::git+$url")
md5sums=('SKIP')
provides=('hyfetch')
conflicts=('hyfetch' 'hyfetch-git' 'hyfetch-extra-git')

prepare() {
  cd "$pkgname"
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
