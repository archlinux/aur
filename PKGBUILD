# Maintainer: Rick Morgans <rick.morgans@gmail.com>
# Contributor: Kristijan Kovilevski <kristijan@digitalnode.com>
# derived from aur/balena-cli by
# Matthew McGinn <mamcgi@gmail.com>
# Gergely Imreh <imrehg@gmail.com>

pkgname=balena-cli-bin
_pkgname="${pkgname%-bin}"
provides=(${_pkgname})
pkgdesc='balena.io command line interface'
pkgver=22.4.16
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
   https://raw.githubusercontent.com/balena-io/balena-cli/f57d0d4a05be3432d2fb736163afd4a8c3e4eec9/completion/balena-completion.bash
)
options=(!strip)
replaces=('resin-cli')
sha256sums=('b35a5e0a8e59042de28ab1054212d281fdb973ac7d31546d1e1ca2dcbd9ea231'
            '13f70e31ac8cf406f529e377c471cf72614976a04fa0bfd4375596aa49e2cae9')

package() {
   install -dm755 "${pkgdir}/opt/"
   cp -r "${srcdir}/balena" "${pkgdir}/opt/"
   install -dm755 "${pkgdir}/usr/bin/"
   ln -s ../../opt/balena/bin/balena "${pkgdir}/usr/bin/balena"
   install -Dm644 "${srcdir}/balena-completion.bash" "${pkgdir}/usr/share/bash-completion/completions/balena"
}
