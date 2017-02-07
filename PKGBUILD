# Maintainer:  Joost Bremmer <toost.b@gmail.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Felip Manyer i Ballester <archlinux at res hyphen telae dot cat>
# Contributor: Alex Ferrando <alferpal@gmail.com>
# Contributor: Zhang Li <richselian at gmail.com>

pkgname=neovim-syntastic
_pkgname=syntastic
pkgver=3.8.0
pkgrel=1
pkgdesc='Automatic syntax checking for Neovim'
arch=('any')
url='https://github.com/vim-syntastic/syntastic'
license=('custom:WTFPL')
depends=('neovim')
groups=('neovim-plugins')
install=nvim-doc.install
source=("$pkgname-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('aa46913abdfa35dfbd9f022d084680b375bf43b32b409378f4a697ab576a5673')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    install -d "${pkgdir}/usr/share/nvim/runtime/"{plugin,doc,autoload/syntastic/,syntax_checkers}
    find . -type d -exec chmod 755 '{}' \;
    cp -dr plugin/* "$pkgdir/usr/share/nvim/runtime/plugin/"
    install -Dm0644 doc/syntastic.txt "${pkgdir}/usr/share/nvim/runtime/doc/syntastic.txt"
    cp autoload/syntastic/* "$pkgdir/usr/share/nvim/runtime/autoload/syntastic/"
    cp -dr syntax_checkers/* "$pkgdir/usr/share/nvim/runtime/syntax_checkers/"

    # remove rustc checker (fixes FS#41517)
    rm -rf "${pkgdir}/usr/share/nvim/runtime/syntax_checkers/rust/"

    # install license file
    install -Dm0644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
