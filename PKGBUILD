# Maintainer:  eadrom <eadrom@archlinux.info>
# Contributor:  Vassilis Palassopoulos <palasso [at] gmail [dot] com>

pkgname=latchbox-git
pkgver=1.3.3.4.r84.b68c2ab
pkgrel=1
pkgdesc='LatchBox is a CLI based password manager that saves account information in an AES256-CBC encrypted file that can securely be accessed and stored by the user'
arch=('any')
url='https://github.com/PawnTakesQueen/latchbox'
license=('BSD')
depends=('glibc')
makedepends=('git' 'go')
optdepends=('xclip: provides clipboard functionality')
provides=('latchbox')
conflicts=('latchbox')
source=('latchbox-git::git+https://github.com/PawnTakesQueen/latchbox.git')
sha256sums=('SKIP')

pkgver() {
    cd $pkgname
    printf "%s.r%s.%s" "$(grep "versionNum =" src/latchbox.go | sed "s/versionNum =//" | tr -d \"\ )" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $pkgname
    make
}

package() {
    cd $pkgname
    install -D -m755 bin/latchbox "${pkgdir}/usr/bin/latchbox"
    install -D -m755 doc/latchbox.1.gz "${pkgdir}/usr/share/man/man1/latchbox.1.gz"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    install -D -m644 THIRD-PARTY-LICENSES "${pkgdir}/usr/share/licenses/$pkgname/THIRD-PARTY-LICENSES"
}
