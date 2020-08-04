# Maintainer: Mike Javorski (javmorin) <mike.javorski@gmail.com>
# Contributor: Aaron Miller <aaronm@cldtk.com>

pkgname=aws-sam-cli
pkgver=1.0.0
pkgrel=1
pkgdesc='CLI tool to build, test, debug, and deploy Serverless applications using AWS SAM'
arch=('any')
url='https://github.com/awslabs/aws-sam-cli'
license=('Apache')
depends=('docker' 'python-click' 'python-flask' 'python-boto3' 'python-jmespath' 'python-yaml' 'python-cookiecutter'
         'python-aws-sam-translator' 'python-docker' 'python-dateparser' 'python-dateutil' 'python-requests'
         'python-serverlessrepo' 'python-aws_lambda_builders' 'python-tomlkit' 'python-chevron')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
       'loosen-requirements.patch')
sha256sums=('76a4f81114b72470256ff6d539c16bc6940aa2158d240dc5858b143c10b96385'
            'eae8a828a6d58d44d6b2e7792e5701dbcb18ccdddb6b74f6a5537913c4ed727f')

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 -i "$srcdir/loosen-requirements.patch"
}

package() {
  cd "$pkgname-$pkgver"

  /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1
}
