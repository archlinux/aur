# Maintainer: Chris Snell <chris dot snell at gmail.com>

pkgname=python-okta
_upstream_name=okta-sdk-python
pkgver=r31.e45b411
pkgver() {
  cd ${_upstream_name}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc='Python SDK for managing Okta instances'
arch=('any')
url="https://github.com/okta/okta-sdk-python"
depends=('python-requests'    'python-dateutil' 'python-six')
makedepends=('python-setuptools' 'git')
source=("git+https://github.com/okta/okta-sdk-python.git")
sha1sums=('SKIP')


build() {
  cd $_upstream_name

  python setup.py build
}

package() {
  cd $_upstream_name

  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

#  rm -f "$pkgdir"/usr/bin/{aws.cmd,aws_bash_completer}
}
