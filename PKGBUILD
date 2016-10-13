# Maintainer:  Joost Bremmer <toost.b@gmail.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Felip Manyer i Ballester <archlinux at res hyphen telae dot cat>
# Contributor: Alex Ferrando <alferpal@gmail.com>
# Contributor: Zhang Li <richselian at gmail.com>

pkgname=neovim-syntastic
_pkgname=syntastic
pkgver=3.7.0
pkgrel=1
pkgdesc='Automatic syntax checking for Neovim'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=2736'
license=('custom:WTFPL')
depends=('neovim')
groups=('neovim-plugins')
install=nvim-doc.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/scrooloose/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('4006fdd5e786ceeb493817c2b6b0d1e6a403089436c958239359a3e7fb7ab016')

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
