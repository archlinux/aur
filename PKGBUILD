# Maintainer: Peter Rice <{first name}@peterrice.xyz>

pkgname=qbpm-git
pkgver=0.3.r2.g8e35376
pkgrel=1
pkgdesc="A profile manager for qutebrowser"
url="https://github.com/pvsr/qbpm"
license=('GPL')
sha512sums=('SKIP')
arch=('any')
depends=('python' 'python-pyxdg')
makedepends=('git' 'python-setuptools')
provides=('qbpm')
conflicts=('qbpm')
source=("git://github.com/pvsr/qbpm")

pkgver() {
  cd qbpm
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd qbpm
  install -D -m644 completions/qbpm.fish ${pkgdir}/usr/share/fish/vendor_completions.d/qbpm.fish
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/qbpm/LICENSE
  python setup.py install --root="$pkgdir" --optimize=1
}
