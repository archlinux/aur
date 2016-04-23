# Maintainer: Matthew Gamble <git@matthewgamble.net>
# Contributor: Alad Wenter <alad@archlinux.info>

pkgname=aurutils-with-signing
pkgver=0.6.0
pkgrel=1
pkgdesc='Helper tools for the AUR, forked to add support for signing packages'
arch=('any')
url='https://github.com/djmattyg007/aurutils-with-signing'
license=('ISC')
source=("https://github.com/djmattyg007/aurutils-with-signing/archive/${pkgver}.tar.gz")
sha256sums=('cd691609296f919a77b35db2346034b6ff853f1cee75303953b91fc9791d0eac')
conflicts=('aurutils')
depends=('pacman' 'git' 'repose' 'jshon' 'pacutils' 'expac' 'aria2' 'devtools' 'python-srcinfo' 'datamash')
checkdepends=('shellcheck')
makedepends=('git')
optdepends=(
    'cower: for downloading packages automatically using aurgrab'
    'time: for tracking build times'
    'vifm: improved build file interaction'
)

check() {
    cd "aurutils-with-signing-${pkgver}/bin"
    # Make errors with C locale visible
    LANG=C shellcheck -x aurbuild aurchain aurgrab aursearch aursift aursplit aurstranger aursync repofind
    LANG=C shellcheck -e 2016 -x aurqueue
}

package() {
    cd "aurutils-with-signing-${pkgver}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/man/man1"
    install -d "${pkgdir}/usr/share/licenses/aurutils-with-signing"
    install -d "${pkgdir}/usr/share/doc/aurutils-with-signing"

    install -m755 bin/aur* bin/repofind "${pkgdir}/usr/bin/"
    install -m644 LICENSE "${pkgdir}/usr/share/licenses/aurutils-with-signing/"
    install -m644 CREDITS README doc/aurutils.example.json "${pkgdir}/usr/share/doc/aurutils-with-signing/"
    install -m644 doc/*.1 "${pkgdir}/usr/share/man/man1/"
}
