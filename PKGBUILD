pkgname=idaholab-raven
pkgver=2.0
pkgrel=1
pkgdesc="multi-purpose probabilistic risk analysis, uncertainty quantification, parameter optimization and data knowledge-discovering framework"
license=('Apache')
arch=('x86_64')
url="https://raven.inl.gov"
depends=('python-scikit-learn' 'python-matplotlib' 'python-statsmodels')
makedepends=('swig' 'python-setuptools')
source=("https://github.com/idaholab/raven/archive/RAVENv${pkgver}.tar.gz")
sha256sums=('e767ef8baae1d22ed332e8587890e523268faf885b80c36273998a9a27d96d38')

package() {
  cd raven-RAVENv${pkgver}
  mkdir -p "$pkgdir/usr/share/raven"
  sed -i "s|  source |  echo source|g" raven_framework
  sed -i "s|utils.find_crow(frameworkDir)||g" framework/Driver.py
  cp -r framework/ scripts/ raven_framework "$pkgdir/usr/share/raven"
  mkdir -p "$pkgdir/usr/bin"
  ln -s "$pkgdir/usr/share/raven/raven_framework" "$pkgdir/usr/bin/raven_framework"
  python setup.py install --root="$pkgdir/" --optimize=1
  cd crow
  python setup.py install --root="$pkgdir/" --optimize=1
}

