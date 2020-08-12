# Maintainer: David Birks <david@birks.dev>

pkgname=aws-cli-v2
pkgver=2.0.39
pkgrel=1
pkgdesc='Universal Command Line Interface for Amazon Web Services (version 2)'
arch=('x86_64')
url='https://github.com/aws/aws-cli'
license=('Apache')
provides=('aws-cli')
conflicts=('aws-cli' 'aws-cli-git' 'aws-cli-v2-bin')
makedepends=(
  'python-botocore-v2-git'
  'python-colorama'
  'python-cryptography'
  'python-distro'
  'python-docutils'
  'python-prompt_toolkit'
  'python-ruamel-yaml'
  'python-s3transfer'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/aws/aws-cli/archive/$pkgver.tar.gz")
sha256sums=('36b8d7bdc66f61801f5abe479141efe20b4cd7238d9dab2d30e9d25fd0bea8a3')

build() {
    cd "$srcdir"/aws-cli-$pkgver
    python setup.py build
}

package() {
    cd "$srcdir"/aws-cli-$pkgver
    python setup.py install --root="$pkgdir"

    install -Dm 644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm 644 bin/aws_bash_completer "$pkgdir"/usr/share/bash-completion/completions/aws
}

