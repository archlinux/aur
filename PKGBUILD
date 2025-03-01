# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='cfn-guard'
pkgver=3.1.2
pkgrel=1
pkgdesc='Guard offers a policy-as-code domain-specific language (DSL) to write rules and validate JSON- and YAML-formatted data such as CloudFormation Templates, K8s configurations, and Terraform JSON plans/configurations against those rules.'
url='https://github.com/aws-cloudformation/cloudformation-guard'
license=('Apache')
arch=('x86_64')
depends=('gcc-libs')
conflicts=("cfn-guard-git")
source=("${url}/releases/download/${pkgver}/${pkgname}-v3-ubuntu-latest.tar.gz")
sha256sums=('7fbdb4fd7cf3f0ef2498717da3b8b4308d7ab405cdfd5a05213dd1a1e0e7b6a7')

build() {
  ${srcdir}/cfn-guard-v3-ubuntu-latest/cfn-guard completions --shell='zsh' > cfn-guard.zsh
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
