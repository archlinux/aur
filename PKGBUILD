# Maintainer: Sam Stuewe <halosghost at archlinux dot info>
_name='portspoof'
pkgname="${_name}-git"
pkgver=1.3
pkgrel=1
pkgdesc='A lightweight, fast, portable and secure addition to any firewall system or security infrastructure.'
url='http://portspoof.org/'
arch=('i686' 'x86_64')
license=('GPLv2')
makedepends=('git')
source=("${_name}::git://github.com/drk1wi/${_name}.git")
sha256sums=('SKIP')

pkgver() {
   cd "${srcdir}/${_name}"
   echo "$(git describe --always|cut -d 'v' -f2|sed -e 's|-|.|g' )"
}

build() {
   cd "${srcdir}/${_name}"
   ./configure --prefix=/usr
   make
}

package() {
   install -d "${pkgdir}"/{usr/bin,etc/"${_name}"}

   cd "${srcdir}/${_name}/src"
   install -Dm755 "${_name}" "${pkgdir}/usr/bin/${_name}"

   cd "${srcdir}/${_name}/tools"
   install -m644 -t "${pkgdir}/etc/${_name}/" "${_name}.conf" "${_name}_signatures"
}
