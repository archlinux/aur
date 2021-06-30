# Maintainer: Sebastien Leduc <sebastien@sleduc.fr>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>

pkgname=python2-paver
pkgver=1.3.4
pkgrel=1
pkgdesc="Build, Distribute and Deploy Python Projects"
arch=('any')
url="https://github.com/paver/paver"
license=('BSD')
depends=('python2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/paver/paver/archive/Paver-$pkgver.tar.gz")
md5sums=('df1eae12c15f81c436232846378b2784')

build() {
  cd paver-Paver-$pkgver
  python setup.py build
}

package() {
  cd paver-Paver-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
  # fix python3 conflict
  for _f in "$pkgdir"/usr/bin/*; do
      mv -v "$_f" "${_f}2"
  done
}
