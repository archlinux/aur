# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Johannes Fürmann 

pkgname=py3status-git
pkgver=3.39.r4.gcafe0c7a
pkgrel=1
pkgdesc="An extensible i3status replacement/wrapper written in python (development version)"
url="https://github.com/ultrabug/py3status"
arch=('any')
license=('custom: Simplified BSD')
conflicts=('py3status')
provides=('py3status')
depends=('python' 'python-setuptools')
makedepends=('git')
optdepends=('i3status: for some of the functionality')
source=("git+https://github.com/ultrabug/py3status.git")
md5sums=('SKIP')

pkgver() {
  cd py3status
  git describe --long --tags | sed 's/-/.r/;s/-/./g'
}

package() {
  cd py3status
  python setup.py install --root="$pkgdir/" --optimize=1
  # doc
  install -d "$pkgdir"/usr/share/doc/$pkgname
  install -m644 docs/user-guide/* README.md CHANGELOG "$pkgdir"/usr/share/doc/$pkgname
  # license
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
