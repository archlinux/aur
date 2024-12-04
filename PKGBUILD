# Maintainer: Procursus Team <team@procurs.us>
# Maintainer: sunchipnacho, Procursus Team
# Contributor: Keto, Procursus Team
# Contributor: Cameron Katri, Procursus Team

pkgname=ldid
pkgver=2.1.5procursus7
_pkgver=2.1.5-procursus7
pkgrel=3
pkgdesc="Put real or fake signatures in Darwin binaries - Procursus fork"
provides=('ldid' 'ldid2')
conflicts=('ldid2')
replaces=('ldid2')
arch=('x86_64' 'aarch64')
url="https://github.com/ProcursusTeam/ldid"
license=('AGPL')
depends=('openssl' 'libplist')
source=("https://github.com/ProcursusTeam/ldid/archive/v$_pkgver.tar.gz"
        "https://github.com/ProcursusTeam/ldid/commit/f38a095aa0cc721c40050cb074116c153608a11b.patch")
sha256sums=('04e461c6f02765e48fc9cc0b68d4dc353a9c46bc1c4d8bac0695509d1af1ff5e'
            'b740c0b91542ab171c3b685bc544a0fb741c1e37d5e001b5b285679f485e40dc')

prepare() {
	cd $pkgname-$_pkgver
	patch -Np1 -i ../f38a095aa0cc721c40050cb074116c153608a11b.patch
}

build() {
	make -C $pkgname-$_pkgver
}

package() {
	make -C $pkgname-$_pkgver install PREFIX="$pkgdir/usr"
	install -Dm644 $pkgname-$_pkgver/_$pkgname "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
