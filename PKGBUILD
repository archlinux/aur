# Maintainer: Jason Stryker <public at jasonstryker dot com>

pkgname=protontricks-git
pkgver=0.r68.06c86eb
pkgrel=1
pkgdesc="A simple wrapper that does winetricks things for Proton enabled games. (Git Version)"
arch=('any')
url="https://github.com/Matoking/protontricks"
license=('GPL3')
depends=('python' 'python-vdf>=2.4' 'winetricks')
optdepends=('zenity: GUI for GNOME desktop')
makedepends=('git' 'python-setuptools')
provides=("protontricks")
conflicts=('protontricks')
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/protontricks"
  
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/protontricks"

  python3 setup.py build
}

package() {
  cd "${srcdir}/protontricks"

  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1

  install -D -m 0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
