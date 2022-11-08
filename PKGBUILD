# Maintainer: Mohammadreza Abdollahzadeh < morealaz at gmail dot com >

pkgname=gnome-shell-extension-search-light-git
pkgver=r32.47250d4
pkgrel=1
pkgdesc='Extension for GNOME shell that takes the apps search widget out of Overview.'
arch=(any)
_githubname=search-light
_githubowner=icedman
url="https://github.com/${_githubowner}/${_githubname}"
license=(GPL3)
depends=('gnome-shell>=43.0')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install='gnome-shell-extension.install'
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_githubname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_githubname}"
    sed -i 's|~/.local|$(DESTDIR)/usr|g' \
        Makefile
}

build() {
    cd "${_githubname}"
    make build
}

package() {
    cd "${_githubname}"
    install -d "${pkgdir}/usr/share/gnome-shell/extensions"
    make DESTDIR="${pkgdir}" install
}
# vim:set ts=4 sw=4 et:
