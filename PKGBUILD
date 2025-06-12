pkgname=thumbor-aws
pkgver=0.8.1
pkgrel=1
pkgdesc='AWS support for Thumbor image service'
arch=('any')
url='https://github.com/thumbor/thumbor-aws'
license=('mit')
depends=(
  python
  python-aiobotocore
  python-deprecated
  python-pycurl
)

source=("https://github.com/thumbor/thumbor-aws/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('6a4384b458032a2318e6edfdcdc5d202')

prepare() {
  # Patch to allow newer python
  cd "$srcdir/thumbor-aws-$pkgver"
  echo "Python version before patch:"
  grep '^python\s*=' pyproject.toml
  sed -i -E 's/python\s*=\s*"(>=3\.8\.1),<3\.13"/python = "\1"/' pyproject.toml
  echo "Python version after patch:"
  grep '^python\s*=' pyproject.toml
}

package() {
  cd "$srcdir/thumbor-aws-$pkgver"
  pip install --root="$pkgdir" --prefix=/usr --no-deps --ignore-installed --no-cache-dir .
}

