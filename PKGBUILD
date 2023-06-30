# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='cfn-guard'
pkgver=3.0.0
pkgrel=1
pkgdesc='Guard offers a policy-as-code domain-specific language (DSL) to write rules and validate JSON- and YAML-formatted data such as CloudFormation Templates, K8s configurations, and Terraform JSON plans/configurations against those rules.'
url='https://github.com/aws-cloudformation/cloudformation-guard'
license=('Apache')
arch=('x86_64')
depends=('gcc-libs')
conflicts=("cfn-guard-git")
source=("${url}/releases/download/${pkgver}/${pkgname}-v3-ubuntu-latest.tar.gz")
sha256sums=('6aa93074ce470782c388ffbcf391981ea3c2f806c41e4dce1a63c9415f7e9c2b')

build() {
  ${srcdir}/cfn-guard-v3-ubuntu-latest/cfn-guard completions --shell='zsh' > _cfn-guard.zsh
  ${srcdir}/cfn-guard-v3-ubuntu-latest/cfn-guard completions --shell='bash' > cfn-guard.bash
  ${srcdir}/cfn-guard-v3-ubuntu-latest/cfn-guard completions --shell='fish' > cfn-guard.fish
}

package() {
  install -Dm755 ${srcdir}/cfn-guard-v3-ubuntu-latest/cfn-guard "$pkgdir/usr/bin/cfn-guard"
  install -Dm644 ${srcdir}/cfn-guard-v3-ubuntu-latest/README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 ${srcdir}/cfn-guard.zsh "$pkgdir/usr/share/zsh/site-functions/_cfn-guard"
  install -Dm644 ${srcdir}/cfn-guard.bash "$pkgdir/usr/share/bash-completion/completions/cfn-guard"
  install -Dm644 ${srcdir}/cfn-guard.fish "$pkgdir/usr/share/fish/completions/cfn-guard.fish"
}

check() {
  ${srcdir}/cfn-guard-v3-ubuntu-latest/cfn-guard --version
}
