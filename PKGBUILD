# Maintainer: Rick Morgans <rick.morgans@gmail.com>
# Contributor: Kristijan Kovilevski <kristijan@digitalnode.com>
# derived from aur/balena-cli by
# Matthew McGinn <mamcgi@gmail.com>
# Gergely Imreh <imrehg@gmail.com>

pkgname=balena-cli-bin
_pkgname="${pkgname%-bin}"
provides=(${_pkgname})
pkgdesc='balena.io command line interface'
pkgver=23.2.4
pkgrel=1
arch=('x86_64')
url='https://balena.io/'
_github_url="https://github.com/balena-io/balena-cli"
license=('APACHE')
depends=()
makedepends=()
optdepends=(
  'docker: balena build/deploy'
  'openssh: balena ssh'
  'linux-aufs: balena preload/build/deploy --build'
  'avahi: balena scan'
)
optdepends_x86_64=('lib32-glibc: emulated builds')
source=(https://github.com/balena-io/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-x64-standalone.tar.gz)
options=(!strip)
replaces=('resin-cli')
sha256sums=('cade0cf9ca0d3d301bb56ad12fb940c016f54dc1835d8543981a578cc283b66d')

package() {
   install -dm755 "${pkgdir}/opt/"
   cp -r "${srcdir}/balena" "${pkgdir}/opt/"
   install -dm755 "${pkgdir}/usr/bin/"
   ln -s ../../opt/balena/bin/balena "${pkgdir}/usr/bin/balena"
}
