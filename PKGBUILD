# Maintainer: Matthew Gamble <git@matthewgamble.net>
# Contributor: Alad Wenter <alad@archlinux.info>

pkgname=aurutils-with-signing
pkgver=0.4.2
pkgrel=2
pkgdesc='Helper tools for the AUR, forked to add support for signing packages'
arch=('any')
url='https://github.com/djmattyg007/aurutils-with-signing'
license=('ISC')
source=("https://github.com/djmattyg007/aurutils-with-signing/archive/${pkgver}.tar.gz")
sha256sums=('1390d7c5ce48c636c55c4e7f7682b477a5268b69a3ce097806ffae61b2c67f12')
conflicts=('aurutils')
depends=('pacman>=5.0' 'git' 'repose' 'jshon' 'pacutils' 'expac' 'aria2' 'devtools' 'python-srcinfo')
checkdepends=('shellcheck')
makedepends=('git')
optdepends=(
    'cower: for downloading packages automatically using aurgrab'
    'time: for tracking build times'
    'vifm: improved build file interaction'
)

check() {
    cd "aurutils-with-signing-${pkgver}"
    shellcheck -e 2016,2034,2174 -x aurbuild aurgrab
    shellcheck -e 2016,2174 -x aurchain aurqueue aursearch aursift aursync repofind
}

package() {
    cd "aurutils-with-signing-${pkgver}"
    install -d "${pkgdir}"/usr/{bin,share{/licenses,/doc}/aurutils}

    install -m755 ./aur* repofind "${pkgdir}"/usr/bin/
    install -m644 LICENSE "${pkgdir}"/usr/share/licenses/aurutils/
    install -m644 CREDITS doc/* "${pkgdir}"/usr/share/doc/aurutils/
}
