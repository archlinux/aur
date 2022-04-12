# Maintainer: Jonathan Wright <jon@than.io>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

_pkgname=jenkins-job-builder
pkgname=python-$_pkgname
pkgver=3.12.0
pkgrel=4
pkgdesc='Takes simple descriptions of Jenkins jobs in YAML or JSON format and uses them to configure Jenkins'
url='https://jenkins-job-builder.readthedocs.io/en/latest/'
license=('APACHE')
arch=('any')
makedepends=('python-setuptools')
# Removing PyYaML requirement for <6 until patch accepted:
#   https://storyboard.openstack.org/#!/story/2009723
depends=(
  'python-six>=1.9.0'
  'python-yaml>=3.10.0'
  'python-pbr>=1.8'
  'python-stevedore>=1.17.1'
  'python-python-jenkins>=0.4.15'
  'python-fasteners'
  'python-jinja>=2')
source=('https://files.pythonhosted.org/packages/c5/6d/616c26d403cf7cddaabcfe241aa8770fb217b263243ad8350b0152848168/jenkins-job-builder-3.12.0.tar.gz')
sha256sums=('829b28b782d6d4805f62df1e6fbd9626a33358400cb7882a58e0f52a14d08ddb')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  sed -e 's/^PyYAML\(.*\),<6 \(.*\)$/PyYAML\1 \2/' -i requirements.txt
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
