# Maintainer: Rick Morgans <rick.morgans@gmail.com>
# Contributor: Kristijan Kovilevski <kristijan@digitalnode.com>
# derived from aur/balena-cli by
# Matthew McGinn <mamcgi@gmail.com>
# Gergely Imreh <imrehg@gmail.com>

pkgname=balena-cli-bin
_pkgname="${pkgname%-bin}"
provides=(${_pkgname})
pkgdesc='balena.io command line interface'
pkgver=14.1.0
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
    https://github.com/balena-io/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-x64-standalone.zip
   https://raw.githubusercontent.com/balena-io/balena-cli/v${pkgver}/completion/balena-completion.bash
)
options=(!strip)
replaces=('resin-cli')
sha256sums=('3b36459609d580b27b1f088fdc1d7a6cca268300dea1e4423392552bcb67b6d6'
            'e426be016354b1003d7579c8c6deacae5902ecd7383280d9720084fbe541fe88')

package() {
   install -dm755 "${pkgdir}/opt/"
   cp -r "${srcdir}/balena-cli" "${pkgdir}/opt/"
   install -dm755 "${pkgdir}/usr/bin/"
   ln -s ../../opt/balena-cli/balena "${pkgdir}/usr/bin/balena"
   install -Dm644 "${srcdir}/balena-completion.bash" "${pkgdir}/usr/share/bash-completion/completions/balena"
}
