# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Maintainer: Strit <danjohansen at strits dot dk>
#
# Contributor: Jaroslav Lichtblau <dragonlord at aur dot archlinux dot org>
# Contributor: Daniel J Griffiths <ghost1227 at archlinux dot us>
# Contributor: Ronald van Haren <ronald at archlinux dot org>
# Contributor: Alessio 'mOLOk' Bolognino <themolok at gmail dot com>
# Contributor: Pawel Rusinek <p.rusinek at gmail dot com>
# Contributor: Jashua Gentry <https://gitlab.com/pixel293>
# Contributor: John Cheetham <https://gitlab.com/johncheetham>

pkgname="griffith"
pkgver=0.15
pkgrel=1
_gitcommit=05b5803f770818d6309b0946e77de6e523b51fc9
pkgdesc="Movie collection manager application"
arch=('any')
url="https://gitlab.com/Strit/griffith"
license=('GPL2')
depends=('python-gobject' 'sqlite' 'python-reportlab' 'python-pillow' 'python-sqlalchemy')
optdepends=('python-psycopg2: postgreSQL support'
            'mysql-python: MySQL support'
            'python-chardet: encoding detection of imported CSV files'
            'python-gtkspell: spell checking support'
            'griffith-extra-artwork: additional icons'
            'python-tmdbsimple: For TMDB Import support')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/repository/$pkgver/archive.tar.gz")
sha256sums=('SKIP')

build() {
    #cd "${pkgname}-${pkgver}"
    cd "${pkgname}-${pkgver}-${_gitcommit}"

    # new bash_completion directory
    sed -e 's,BASHCOMPDIR = $(ETCDIR)/bash_completion.d,BASHCOMPDIR = $(PREFIX)/share/bash-completion/completions,' -i Makefile
}

package() {
    cd "${pkgname}-${pkgver}-${_gitcommit}"

    make DESTDIR=${pkgdir} install

    # The program creates a wrong symlink so make a new one
	rm ${pkgdir}/usr/bin/griffith
	ln -s /usr/share/griffith/lib/griffith ${pkgdir}/usr/bin/griffith

    # The program creates a etc directory empty
    rm -rf ${pkgdir}/etc
}

# vim:set ts=4 sw=2 ft=sh et:
