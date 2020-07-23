# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-sacremoses-git
pkgver=0.0.35.r41.gb94654f
pkgrel=1
pkgdesc='Python port of Moses tokenizer, truecaser and normalizer'
arch=('any')
url='https://github.com/alvations/sacremoses'
license=('MIT')
provides=('python-sacremoses')
conflicts=('python-sacremoses')
depends=('python-six'
         'python-click'
         'python-joblib'
         'python-tqdm'
         'python-regex')
makedepends=('python-setuptools')
source=("${pkgname%-git}::git+https://github.com/alvations/sacremoses")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  sed -i "s|==|>=|" requirements.txt
}

build() {
  cd "${pkgname%-git}"
  python setup.py build
}

package() {
  cd "${pkgname%-git}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}