# Maintainer: Mike Javorski (javmorin) <mike.javorski@gmail.com>
# Contributor: Aaron Miller <aaronm@cldtk.com>

pkgname=aws-sam-cli
pkgver=1.2.0
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
sha256sums=('6ed0b75020af5597cc2f1fd289e249dc3d7f7dc5f6561e9ba7a0752cbb18fd1b'
            'fbc6572096f3901e49d7390847a8f4a46c815d94ffb23564a9be30c30825fb68')

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 -i "$srcdir/loosen-requirements.patch"
}

package() {
  cd "$pkgname-$pkgver"

  /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1
}
