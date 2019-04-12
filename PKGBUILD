# Maintainer: Jason Stryker <public at jasonstryker dot com>

pkgname=protontricks
pkgver=1.2.1
pkgrel=1
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
sha512sums=('386f7161f6c364d3420fd1b4d0e21f6e3af51d27f9e558c574695168b79f37548e695a3f1c2a773eb1f1feee9b601a7044b6a339f21338cf6fc0272dba865499')

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
