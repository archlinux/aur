# Maintainer: Marcel Campello <marcel.campello@prafrentex.com.br>
# Contributor: David Birks <david@birks.dev>

pkgname='aws-cli-v2'
pkgver='2.8.3'
pkgrel='1'

pkgdesc='Unified command line interface for Amazon Web Services (version 2)'
arch=('x86_64')
url='https://github.com/aws/aws-cli/tree/v2'
license=('Apache')

depends=(
  'python-colorama'
  'python-docutils'
  'python-cryptography'
  'python-ruamel-yaml'
  'python-wcwidth'
  'python-prompt_toolkit'
  'python-distro'
  'python-awscrt'
  'python-dateutil'
  'python-jmespath'
  'python-urllib3'
)
makedepends=(
  'python-build'
  'python-wheel'
  'python-flit'
  'python-installer'
)

provides=('aws-cli')
conflicts=('aws-cli' 'aws-cli-git' 'aws-cli-v2-bin')

source=("$pkgname-$pkgver.tar.gz::https://github.com/aws/aws-cli/archive/$pkgver.tar.gz")
sha256sums=('d96d176262b65f03eab6ef9728ff79e9a30a082aa51285ee012ab58cefb39d55')

build() {
  cd "$srcdir/aws-cli-$pkgver"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$srcdir/aws-cli-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 bin/aws_bash_completer "$pkgdir/usr/share/bash-completion/completions/aws"
}
