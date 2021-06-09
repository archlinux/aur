# Maintainer: BrLi <brli chakralinux org>
# Contributor: HIME team
_pkgname=hime
pkgname=hime-git
pkgver=1268.1310167
pkgrel=1
pkgdesc="A GTK2+/GTK3+ based universal input method platform"
arch=('i686' 'x86_64')
url="http://hime-ime.github.io/"
license=('LGPL2' 'FDL' 'GPL2')
depends=('gtk2' 'libxtst')
makedepends=('git' 'gettext' 'libchewing' 'anthy')
optdepends=('gtk3: enable gtk3 im module'
            'qt5-base: enable qt5 im module'
            'anthy: enable Anthy input method'
            'libchewing: enable Chewing input method')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/hime-ime/hime.git")
sha512sums=('SKIP')


pkgver() {
    cd "${srcdir}/${_pkgname}"
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
    cd "${srcdir}/${_pkgname}"
    ./configure --prefix=/usr --disable-lib64 --qt5-im-module-path=/usr/lib/qt/plugins/platforminputcontexts/
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="${pkgdir}" install

    install -dm755 "${pkgdir}/usr/share/licenses/${_pkgname}/"
    # install licence files
    install -Dm644 fdl-1.2.txt gpl-2.0.txt lgpl-2.1.txt "${pkgdir}/usr/share/licenses/${_pkgname}/"
}
