# Maintainer: Michele Palazzi <sysdadmin@m1k.cloud>
basename=pacdef
pkgname=${basename}-python
pkgver=1.0.0
pkgrel=1
pkgdesc='declarative package manager for Arch Linux'
url='https://github.com/ironashram/pacdef'
source=("${basename}-${pkgver}.tar.gz::https://github.com/ironashram/${basename}/archive/refs/tags/v${pkgver}.tar.gz")
arch=('any')
license=('GPL3')
depends=('python' 'pyalpm')
makedepends=('python-pip')
conflicts=('pacdef' 'pacdef-git')
checkdepends=('python-pytest' 'python-mock')
sha256sums=('5bf5c1404a3821e1ac2b766551fd7b55c88581f0fca3d23600830185596f6cbc')

check() {
  cd "${srcdir}/${basename}-${pkgver}"
  python -m pytest -v
}

package() {
  cd "${srcdir}/${basename}-${pkgver}"
  pip install --root="${pkgdir}/" --no-deps --ignore-installed .
  install -Dm644 _completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_pacdef"
}
