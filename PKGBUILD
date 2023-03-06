# Maintainer: Peter Rice <{first name}@peterrice.xyz>

pkgname=qbpm-git
pkgver=1.0.rc2.r1
pkgrel=1
pkgdesc="A profile manager for qutebrowser"
url="https://github.com/pvsr/qbpm"
license=('GPL')
sha512sums=('SKIP')
arch=('any')
depends=('python' 'python-pyxdg' 'python-click')
makedepends=('git' 'python-setuptools' 'scdoc')
provides=('qbpm')
source=("git+https://github.com/pvsr/qbpm")

pkgver() {
  cd qbpm
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd qbpm
  install -D -m644 completions/qbpm.fish ${pkgdir}/usr/share/fish/vendor_completions.d/qbpm.fish
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/qbpm/LICENSE

  scdoc < qbpm.1.scd > qbpm.1
  install -D -m644 qbpm.1 ${pkgdir}/usr/share/man/man1/qbpm.1

  python setup.py install --root="$pkgdir" --optimize=1
}
