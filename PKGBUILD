# Maintainer: Matthew Gamble <git@matthewgamble.net>
# Contributor: Alad Wenter <alad@archlinux.info>

pkgname=aurutils-with-signing
pkgver=0.5.1
pkgrel=1
pkgdesc='Helper tools for the AUR, forked to add support for signing packages'
arch=('any')
url='https://github.com/djmattyg007/aurutils-with-signing'
license=('ISC')
source=("https://github.com/djmattyg007/aurutils-with-signing/archive/${pkgver}.tar.gz")
sha256sums=('9a0a908d9b4fe9e04f24789a10b311101a18a81afceb7e5ed3839542c234266b')
conflicts=('aurutils')
depends=('pacman>=5.0' 'git' 'repose' 'jshon' 'pacutils' 'expac' 'aria2' 'devtools' 'python-srcinfo' 'datamash')
checkdepends=('shellcheck')
makedepends=('git')
optdepends=(
    'cower: for downloading packages automatically using aurgrab'
    'time: for tracking build times'
    'vifm: improved build file interaction'
)

check() {
    cd "aurutils-with-signing-${pkgver}/bin"
    shellcheck -e 2016,2034,2174 -x aurbuild aurgrab
    shellcheck -e 2016,2174 -x aurchain aurqueue aursearch aursift aursplit aurstranger aursync repofind
}

package() {
    cd "aurutils-with-signing-${pkgver}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/man/man1"
    install -d "${pkgdir}/usr/share/licenses/aurutils-with-signing"
    install -d "${pkgdir}/usr/share/doc/aurutils-with-signing"

    install -m755 bin/aur* bin/repofind "${pkgdir}/usr/bin/"
    install -m644 LICENSE "${pkgdir}/usr/share/licenses/aurutils-with-signing/"
    install -m644 CREDITS README.org doc/aurutils.example.json "${pkgdir}/usr/share/doc/aurutils-with-signing/"
    install -m644 doc/*.1 "${pkgdir}/usr/share/man/man1/"
}
