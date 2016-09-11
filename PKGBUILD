# Maintainer: Ainola
pkgname=neovim-csound
pkgver=1
pkgrel=3
pkgdesc="Set of Tools for Editing Csound Files with Neovim"
arch=('any')
url="https://github.com/luisjure/csound"
license=('MIT')
groups=('neovim-plugins')
optdepends=('csound'
            'neovim')
install='neovim-csound.install'
# FIXME: version numbers are coming soon, for now use master git
source=('csound.vim.tar.gz'::'https://github.com/luisjure/csound/archive/master.zip')
sha256sums=('ba8d1ff197dea423a17843e9818728adfcae22f570478553fd38c076129d8d15')

prepare(){
  # Package was made for vim: nvim doesn't use the same structure.
  find "$srcdir" -type f -exec sed -i 's@$VIM/vimfiles@$VIM/runtime@g' {} +
}

package() {
  _vimdir="$pkgdir/usr/share/nvim/runtime"
  install -Dm 644 "$srcdir/csound-master/doc/csound.txt" \
                  "$_vimdir/doc/csound.txt"
  install -Dm 644 "$srcdir/csound-master/ftdetect/csound.vim" \
                  "$_vimdir/ftdetect/csound.vim"
  install -Dm 644 "$srcdir/csound-master/macros/csound.vim" \
                  "$_vimdir/macros/csound.vim"
  install -Dm 644 "$srcdir/csound-master/syntax/csound.vim" \
                  "$_vimdir/syntax/csound.vim"
  install -Dm 644 "$srcdir/csound-master/syntax/csound.vim" \
                  "$_vimdir/syntax/csound.vim"
  install -Dm 644 "$srcdir/csound-master/templates/template.csd" \
                  "$_vimdir/templates/template.csd"

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 "$srcdir/csound-master/LICENSE" \
                  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 "$srcdir/csound-master/README.md" \
                  "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: ts=2 sw=2 et
