# Maintainer: Rick Morgans <rick.morgans@gmail.com>
# Contributor: Kristijan Kovilevski <kristijan@digitalnode.com>
# derived from aur/balena-cli by
# Matthew McGinn <mamcgi@gmail.com>
# Gergely Imreh <imrehg@gmail.com>

pkgname=balena-cli-bin
_pkgname="${pkgname%-bin}"
provides=(${_pkgname})
pkgdesc='balena.io command line interface'
pkgver=22.5.0
pkgrel=1
arch=('x86_64')
url='https://balena.io/'
_github_url="https://github.com/balena-io/balena-cli"
license=('APACHE')
depends=()
makedepends=()
optdepends=(
  'docker: balena build/deploy'
  'python2: balena preload'
  'openssh: balena ssh'
  'linux-aufs: balena preload/build/deploy --build'
  'avahi: balena scan'
)
optdepends_x86_64=('lib32-glibc: emulated builds')
source=(
   https://github.com/balena-io/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-x64-standalone.tar.gz
   https://raw.githubusercontent.com/balena-io/balena-cli/9cfdfcdc461af39d3cca65770e050a2d2152bff2/completion/balena-completion.bash
)
options=(!strip)
replaces=('resin-cli')
sha256sums=('f9e2b4585363d89736cb98c4075c842bca2589a20ff99fe2eef7ff9a443f3746'
            '13f70e31ac8cf406f529e377c471cf72614976a04fa0bfd4375596aa49e2cae9')

package() {
   install -dm755 "${pkgdir}/opt/"
   cp -r "${srcdir}/balena" "${pkgdir}/opt/"
   install -dm755 "${pkgdir}/usr/bin/"
   ln -s ../../opt/balena/bin/balena "${pkgdir}/usr/bin/balena"
   install -Dm644 "${srcdir}/balena-completion.bash" "${pkgdir}/usr/share/bash-completion/completions/balena"
}
