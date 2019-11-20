# Maintainer kang <kang@insecure.ws>

pkgname='python-mozilla-aws-cli-git'
_pkgname=mozilla-aws-cli
pkgver=v0.1.0.r1.g7fe776c
pkgrel=1
pkgdesc="Command line tool to enable accessing AWS using federated single sign on"
arch=('any')
url="https://github.com/mozilla-iam/mozilla-aws-cli"
license=('MPL')
makedepends=('git' 'python-setuptools' 'python2-setuptools')
depends=('python' 'python-jose' 'python-requests' 'python-console-menu-git' 'python-flask')
source=('git://github.com/mozilla-iam/mozilla-aws-cli' 'config')
md5sums=('SKIP'
         '05602a69b352ac548f2c0f2e9aad5a7e')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  python setup.py build
}

package() {
  cd $_pkgname
  python setup.py install --root=${pkgdir} --optimize=1
  install -D -m644 ${startdir}/config ${pkgdir}/etc/mozilla_aws_cli/config
}
