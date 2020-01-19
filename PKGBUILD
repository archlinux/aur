# Maintainer: Nahuel Gomez Castro <nahual_gomca@outlook.com.ar>

pkgname='app-icon-preview'
pkgver='1.0.1'
pkgrel='2'
pkgdesc='Tool for designing applications icons.'
changelog='CHANGELOG'
arch=('x86_64')
url="https://gitlab.gnome.org/World/design/${pkgname}"
license=('GPL3')
depends=('librsvg' 'libdazzle' 'libhandy')
makedepends=('vala' 'meson' 'git')
source=("git+${url}.git#tag=${pkgver}"
        "git+https://gitlab.gnome.org/Teams/Design/HIG-app-icons.git")
sha256sums=('SKIP'
            'SKIP')

pkgver () {
	cd ${pkgname}
	git describe --tags | sed 's/-/.r/; s/-/./'
}

prepare () {
    cd ${pkgname}
    
    git submodule init
    git config --local submodule.src/hig.url "${srcdir}/HIG-app-icons"
    git submodule update
}

build () {
	arch-meson ${pkgname} build
	ninja -C build
}

package () {
	DESTDIR="${pkgdir}" ninja -C build install
}
