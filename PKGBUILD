# Maintainer: Hasan Çatalgöl <hasancatalgol@gmail.com>

pkgname=python-redshift-connector
pkgver=2.1.8
pkgrel=1
pkgdesc="Amazon Redshift connector for Python (DB-API 2.0)"
arch=('any')
url="https://github.com/aws/amazon-redshift-python-driver"
license=('Apache-2.0')

# Runtime deps (from upstream requirements)
depends=(
  'python'
  'python-scramp'              # AUR
  'python-pytz'
  'python-beautifulsoup4'
  'python-boto3'
  'python-requests'
  'python-lxml'
  'python-botocore'
  'python-packaging'
  'python-setuptools'
)

# Only need installer when using a prebuilt wheel
makedepends=('python-installer')

# PyPI only provides a wheel for 2.1.8 (no sdist)
# Use the exact wheel URL from the PyPI Files tab
source=("https://files.pythonhosted.org/packages/f4/2b/f7603f0acf01de0c9f7e4294c8a5ac346cc12cb93b81e52eaddd15d37400/redshift_connector-${pkgver}-py3-none-any.whl")
sha256sums=('160dff3720e8facb5f50f9585f3f68dd5565dd0d986e4e6a879371313da1b36e')

# No build() necessary when installing a wheel
# build() { :; }

package() {
  # Install the wheel into $pkgdir
  python -m installer --destdir="$pkgdir" "redshift_connector-${pkgver}-py3-none-any.whl"

  # Copy license into the standard location if present in dist-info
  shopt -s nullglob globstar
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  for f in "$pkgdir"/usr/lib/python*/site-packages/redshift_connector-*/licenses/*; do
    install -m644 "$f" "$pkgdir/usr/share/licenses/$pkgname/"
  done
}
