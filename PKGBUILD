# Maintainer: Ivy Foster <joyfulgirl@archlinux.us>
# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>

pkgname=translate-shell-git
_gitname=translate-shell
pkgver=v0.9.0.4.7.g1a4d83e
pkgrel=1
pkgdesc='A command-line interface and interactive shell for Google Translate.'
arch=('i686' 'x86_64')
url="http://www.soimort.org/translate-shell/"
license=('custom:PublicDomain')
makedepends=('git')
optdepends=(
    'fribidi: display right-to-left languages'
    'mplayer: Text-to-Speech functionality'
    'mplayer2: Text-to-Speech functionality'
    'mpv: Text-to-Speech functionality'
    'mpg123: Text-to-Speech functionality'
    'espeak: Text-to-Speech functionality'
    'rlwrap: readline-style editing and history in the interactive mode'
    'emacs: Emacs interface'
)
provides=('translate-shell')
source=("git://github.com/soimort/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
    cd $_gitname
    git describe --always | sed 's|-|.|g'
}

build() {
    cd $_gitname
    make
}

package() {
    cd $_gitname
    install -d "${pkgdir}"/usr/{bin,share/man/man1}
    make PREFIX="${pkgdir}"/usr install
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${_gitname}/LICENSE
}
