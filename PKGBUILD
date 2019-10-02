# Maintainer: Jason Stryker <public at jasonstryker dot com>

pkgname=protontricks
pkgver=1.2.5
pkgrel=2
pkgdesc="A simple wrapper that does winetricks things for Proton enabled games."
arch=('any')
url="https://github.com/Matoking/protontricks"
license=('GPL3')
depends=('python' 'python-vdf>=2.4' 'winetricks')
optdepends=('zenity: GUI for GNOME desktop')
makedepends=('git' 'python-setuptools')
provides=("protontricks")
conflicts=('protontricks-git')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('51371d2e2902df3c451ac9fc58ea3287d6ca2c10380a6629206ed8cf2244473593097a07046c81393209f2631d03b41632dc862480c0d586205fba03df5ec086')

build() {
  cd "${srcdir}/protontricks-${pkgver}"

  python3 setup.py build
}

package() {
  cd "${srcdir}/protontricks-${pkgver}"

  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1

  install -D -m 0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
