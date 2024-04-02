#Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
#Contributor: "@Me Derp#3541 "<discord>

pkgname=hid-mimouse-dkms-git
_pkgbase=hid-mimouse
pkgver=r3.42f50b6
pkgrel=3
pkgdesc="Fixes Mi Silent Mouse side buttons (DKMS)"
arch=('x86_64')
url='https://github.com/matega/hid_mimouse'
license=('AGPL-3.0-only AND GPL-3.0-or-later')
depends=('dkms')
makedepends=('git')
conflicts=($_pkgbase "$_pkgbase-git" "$_pkgbase-dkms")
provides=("$_pkgbase" "$_pkgbase-dkms")
source=("$_pkgbase::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package () {
    cd "$_pkgbase"

    install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
    install -Dm644 hid-mimouse.c "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/hid-mimouse.c
    install -Dm644 Makefile "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/Makefile
}
