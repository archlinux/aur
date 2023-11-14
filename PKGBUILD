# Maintainer: Allison Smith <alyway@protonmail.com>
# Contributor: Piao Chen <ssfdust@gmail.com>

pkgname=wf-msg-git
pkgver=r18.ff26b8f
pkgrel=2
pkgdesc="Wayfire goodies: dbus interface, wf-msg (inspired by swaymsg) and wf-utils"
arch=('any')
url="https://github.com/tombh/wf-msg"
license=('MIT')
depends=("wayfire-plugins-extra" "bash")
makedepends=("git")
provides=("wf-msg")
conflicts=("wf-msg")
options=()
install=
changelog=
source=("${pkgname}::git+https://github.com/tombh/wf-msg")
sha256sums=('SKIP')

pkgver () {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${pkgname}"
    find wf-msg -exec install -D {} "${pkgdir}/usr/share/wf-msg/{}" ';'
    find wf-utils -exec install -D {} "${pkgdir}/usr/share/wf-msg/{}" ';'
    mkdir "${pkgdir}/usr/bin"
    install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/$pkgname/
    ln -s /usr/share/wf-msg/wf-msg/wf-msg "${pkgdir}/usr/bin/wf-msg"
    ln -s /usr/share/wf-msg/wf-utils/wf-utils "${pkgdir}/usr/bin/wf-utils"
}
