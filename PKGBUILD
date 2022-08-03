# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: bitwave <aur [aT] oomlu {d.0t} de>
# Contributor: yochananmarqos

pkgname=notepadnext
pkgver=0.5.4
pkgrel=1
pkgdesc="Cross-platform reimplementation of Notepad++"
arch=('x86_64')
url="https://github.com/dail8859/NotepadNext"
license=('GPL3')
depends=('qt6-5compat' 'hicolor-icon-theme')
makedepends=('git' 'qt6-tools')
source=("$pkgname::git+$url#tag=v$pkgver"
        'git+https://github.com/alex-spataru/QSimpleUpdater'
        'git+https://github.com/githubuser0xFFFF/Qt-Advanced-Docking-System'
        'git+https://github.com/editorconfig/editorconfig-core-qt'
        'git+https://github.com/itay-grudev/SingleApplication'
        'git+https://gitlab.freedesktop.org/uchardet/uchardet')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
	cd "$pkgname"
	git submodule init
	git config submodule.src/QSimpleUpdater.url "$srcdir/QSimpleUpdater"
	git config submodule.src/src/ads.url "$srcdir/Qt-Advanced-Docking-System"
	git config submodule.src/editorconfig-core-qt.url "$srcdir/editorconfig-core-qt"
	git config submodule.src/singleapplication.url "$srcdir/SingleApplication"
	git config submodule.src/uchardet.url "$srcdir/uchardet"
	git submodule update

	mkdir -p build
}

build() {
	cd "$pkgname/build"
	qmake6 ../src/NotepadNext.pro
	make
}

package() {
	make -C "$pkgname/build" INSTALL_ROOT="$pkgdir" install
}
