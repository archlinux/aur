# Maintainer: Falk Alexander Seidl <fa@terminal.run>

pkgname=setzer-git
_gitname=Setzer
pkgver=r55.5adb927
pkgrel=1
pkgdesc="LaTeX editor written in Python with Gtk"
arch=('i686' 'x86_64')
url="https://github.com/cvfosammmm/Setzer"
license=('GPL3')
depends=('gtk3' 'gtksourceview3' 'poppler-glib' 'texlive-core' 'gspell')
makedepends=('git')
source=("git+https://github.com/cvfosammmm/Setzer")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}/"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    find -type d | xargs chmod 755
    find -type f | xargs chmod 644
}

package() {
    install -d "${pkgdir}"/opt/setzer
    install -d "${pkgdir}"/usr/bin
    cp -r "${_gitname}"/* "${pkgdir}"/opt/setzer/

    install -D -m644 "${srcdir}/${_gitname}"/resources/images/org.cvfosammmm.Setzer.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/org.cvfosammmm.Setzer.svg
    install -D -m644 "${srcdir}/${_gitname}"/resources/org.cvfosammmm.Setzer.desktop "${pkgdir}"/usr/share/applications/org.cvfosammmm.Setzer.desktop
    touch "${pkgdir}"/usr/bin/setzer
    echo -e "#!/bin/bash\npython3 /opt/setzer/__main__.py\n" >> "${pkgdir}"/usr/bin/setzer
    chmod +x "${pkgdir}"/usr/bin/setzer
}
