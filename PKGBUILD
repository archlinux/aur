# Maintainer: Jonathan Wright <jon@than.io>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

_pkgname=jenkins-job-builder
pkgname=python-$_pkgname
pkgver=4.1.0
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
source=('https://files.pythonhosted.org/packages/45/9b/bf0f284d27fd41707d849126b5bac29a1a02919304372a334ed869613318/jenkins-job-builder-4.1.0.tar.gz')
sha256sums=('e630a5b5da260f8bb92d9ad824550707fb0b3915d8b96a1e24e6a501c8b4f974')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  sed -e 's/^PyYAML\(.*\),<6 \(.*\)$/PyYAML\1 \2/' -i requirements.txt
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
