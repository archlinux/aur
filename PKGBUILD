# Maintainer: James An <james@jamesan.ca>
# Contributor: stef312 <stef312_at_gmail_dot_com>

_pkgname=CipherShed
pkgname=${_pkgname,,}-nogui-git
pkgver=7.1a
pkgrel=1
pkgdesc="Free encryption software for keeping your data secure and private (a fork of the now-discontinued TrueCrypt Project)."
url="https://ciphershed.org/"
arch=('i686' 'x86_64')
license=('custom:Truecrypt License 3.0') # TrueCrypt License v3.0
depends=(
    'fuse>=2.8.0'
    'wxgtk2.8>=2.8.9'
    'libsm'
    'device-mapper'
    'p11-kit'
)
makedepends=('nasm' 'git')
optdepends=('sudo: mounting encrypted volumes as nonroot users')
conflicts=('truecrypt' 'truecrypt-utils', "${_pkgname,,}", "${_pkgname,,}-nogui")
replaces=('truecrypt' 'truecrypt-utils')
source=("git+https://github.com/${_pkgname}/${_pkgname}.git")
md5sums=('SKIP')

build() {
    cd "${_pkgname}/src"

    NOGUI=1 WX_CONFIG=/usr/bin/wx-config-2.8 LIBS="-ldl" make
}

package() {
  cd "${_pkgname}/src"

  install -Dm755 Main/${_pkgname,,} "${pkgdir}/usr/bin/${_pkgname,,}"
  install -Dm644 License.txt "${pkgdir}/usr/share/licenses/${_pkgname,,}-nogui/LICENSE"
}
