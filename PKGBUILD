# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='cfn-guard-git'
pkgver=2.0.4.r0.g23690a6
pkgrel=1
pkgdesc='A set of tools to check AWS CloudFormation templates for policy compliance using a simple, policy-as-code, declarative syntax'
url='https://github.com/aws-cloudformation/cloudformation-guard'
depends=('gcc-libs')
makedepends=('rust')
license=('Apache')
arch=('x86_64')
conflicts=("cfn-guard")
source=('git+https://github.com/aws-cloudformation/cloudformation-guard')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/cloudformation-guard
  git describe --long --tags|sed 's/\([^-]*-g\)/r\1/;s/[-_]/./g;s/^release.//'
}

build() {
  cd "$srcdir"/cloudformation-guard
  cargo build --release
}

package() {
  cd "$srcdir"/cloudformation-guard
  install -Dm755 target/release/cfn-guard "$pkgdir/usr/bin/cfn-guard"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname%-*}/README.md"
}
