# Maintainer:  Yamada Hayao <hayao@fascode.net> 
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Tatsuyuki Ishi <ishitatsuyuki at gmail>
# Contributor: Ben Darwin <bcdarwin at gmail>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Lone_Wolf <lonewolf@xs4all.nl>

pkgname='zeroinstall-injector'
_pkgname=0install
pkgver=2.16
pkgrel=1
pkgdesc='A decentralised cross-distribution software installation system'
arch=('i686' 'x86_64')
url='https://0install.net'
license=('LGPL-2.1')
provides=('0install' 'zeroinstall')
depends=('ocaml-curl'
		 'ocaml-extlib'
		 'ocaml-lwt'
		 'ocaml-ounit'
		 'ocaml-xmlm'
		 'ocaml-yojson')
optdepends=('ocaml-lablgtk: provides GUI features'
            'ocaml-obus: for DBUS, packagekit, and NetworkManager integration'
            'xdg-utils: desktop integration'
            'packagekit: packagekit integration')
makedepends=('ocaml-findlib' 'dune>=2.1')
install="$pkgname.install"
source=("https://github.com/0install/0install/archive/v${pkgver}.tar.gz")
md5sums=('ac054831c5bca558567007a464c4545a')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  env DESTDIR="${pkgdir}" \
    OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)" \
    make install
}