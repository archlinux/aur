# Maintainer: wallace < str(11) + my_id at gmail dot com>

pkgname=dotbare
pkgdesc="Manage your dotfiles interactively with fzf"
pkgver=1.3.1
pkgrel=1
arch=("any")
url="https://github.com/kazhala/dotbare"
license=("MIT")
depends=('fzf')
optdepends=(
    'tree: Provide a directory tree view when finding directory'
    'bat: Syntax highlighting when previewing files'
    'highlight: Syntax highlighting when previewing files'
    'ruby-coderay: Syntax highlighting when previewing files'
    'git-delta: Fancy git diff preview'
    'diff-so-fancy: Fancy git diff preview')
source=("https://github.com/kazhala/dotbare/archive/v${pkgver}.tar.gz" "${pkgname}")
md5sums=('d330aa1fe4b072e2ab6d8762d4d3be7f'
         'f6c62c573ace6e97e1948944cf6454cd')

package() {
    src="${srcdir}/${pkgname}-${pkgver}"
    dest="${pkgdir}/opt/${pkgname}"

    # create dirs
    install -d ${dest}/{,helper,scripts}
    # main script
    install -Dm 755 ${src}/${pkgname} ${dest}
    # additional dirs contents
    for dir in helper scripts; do
        install -Dm 755 ${src}/${dir}/* ${dest}/${dir}
    done

    # HACK: remove upgrade script since we're not on the git repo
    rm ${dest}/scripts/fupgrade

    # custom "launcher" script
    install -Dm 755 ${srcdir}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
