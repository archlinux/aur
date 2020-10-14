# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='cfn-guard-git'
pkgver=1.0.0.r30.g7adfe51
pkgrel=1
pkgdesc='A set of tools to check AWS CloudFormation templates for policy compliance using a simple, policy-as-code, declarative syntax'
url='https://github.com/aws-cloudformation/cloudformation-guard'
depends=('gcc-libs')
makedepends=('rust')
license=('Apache')
arch=('x86_64')
source=('git+https://github.com/aws-cloudformation/cloudformation-guard')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/cloudformation-guard
  git describe --long --tags|sed 's/\([^-]*-g\)/r\1/;s/[-_]/./g;s/^release.//'
}

build() {
  cd "$srcdir"/cloudformation-guard
  make cfn-guard cfn-guard-rulegen
}

package() {
  cd "$srcdir"/cloudformation-guard
  install -Dm755 bin/cfn-guard "$pkgdir/usr/bin/cfn-guard"
  install -Dm755 bin/cfn-guard-rulegen "$pkgdir/usr/bin/cfn-guard-rulegen"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname%-*}/README.md"
}
