# Maintainer: Mubashshir <ahmubashshir@gmail.com>
# Contributor: Brett Cornwall <ainola@archlinux.org>
# Contributor: Sébastien Luttringer
# Contributor: eric
# Contributor: Tom Newsom
# Contributor: Chris Brannon

pkgname=stow-dotfiles
pkgver=2.3.1
pkgrel=2
pkgdesc="Manage installation of multiple softwares in the same directory tree (with AitorATuin's patches for --dotfiles)"
url='https://www.gnu.org/software/stow/'
arch=('any')
license=('GPL3')
depends=('perl')
provides=('stow')
conflicts=('stow')
checkdepends=('perl-test-output' 'perl-io-stringy')
source=("https://ftp.gnu.org/gnu/${pkgname%-*}/${pkgname%-*}-$pkgver.tar.gz"
        "dotfiles.diff::https://patch-diff.githubusercontent.com/raw/aspiers/stow/pull/70.diff")
sha256sums=('09d5d99671b78537fd9b2c0b39a5e9761a7a0e979f6fdb7eabfa58ee45f03d4b'
            'effe1387783e6f0046ad02ffb1647a083d49a887bea5e09173ea45dd5a11548f')

prepare() {
	cd "${pkgname%-*}-$pkgver"
	patch -p1 < "$srcdir/dotfiles.diff"
}

build() {
    cd "${pkgname%-*}-$pkgver"
    ./configure \
        --prefix=/usr \
        --mandir=/usr/share/man \
        --infodir=/usr/share/info \
        --with-pmdir=/usr/share/perl5/vendor_perl
    make
}

check() {
    cd "${pkgname%-*}-$pkgver"
    make check
}

package() {
    cd "${pkgname%-*}-$pkgver"
    make DESTDIR="$pkgdir" install
}
