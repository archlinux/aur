# Maintainer: m4dz <code(at)m4dz(dot)net>

pkgname=gitbook-editor
pkgver=5.0.4
pkgrel=1
pkgdesc="Gitbook Editor - Write and publish books"
arch=('i686' 'x86_64')
url="https://www.gitbook.com/editor/linux"
license=('custom')

source_x86_64=("gitbook-editor-${pkgver}-linux-x64.deb::https://www.gitbook.com/editor/linux-64-bit/download")
source_i686=("gitbook-editor-${pkgver}-linux-ia32.deb::https://www.gitbook.com/editor/linux-32-bit/download")

sha256sums_x86_64=('fff40d479ad0e9770a7e1796dbb5c8c2aeda996fab576fb698fd6f2af1b7f7bd')
sha256sums_i686=('f2bd5b76ad037faf254be796cdc86e19c5e99a760cd17aa3560b0e0cc9aa6ce1')

prepare() {
    bsdtar -xJf data.tar.xz
}

package() {
    # Copy files
    cp -r {opt,usr} "${pkgdir}"

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +

    # Move license
    install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
    mv ${pkgdir}/opt/gitbook-editor/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
}
