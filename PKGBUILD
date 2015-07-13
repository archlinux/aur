# Maintainer: Sebastien Leduc <sebastien@sleduc.fr>
# Contributor: Andrey Vlasovskikh <andrey.vlasovskikh@gmail.com>

pkgname="vim-command-t"
pkgver=1.13
pkgrel=1
pkgdesc="an extremely fast, intuitive mechanism for opening files and buffers with a minimal number of keystrokes"
arch=("i686" "x86_64")
url="https://wincent.com/products/command-t"
license=("BSD")
groups=("vim-plugins")
depends=("vim" "ruby")
install="vimdoc.install"

source="https://github.com/wincent/Command-T/archive/$pkgver.tar.gz"
md5sums=('781160833b1e4e95c99ce1401b647b85')

build() {
  cd "$srcdir/command-t-$pkgver/ruby/command-t"

  ruby "extconf.rb"
  make
}

package() {
  local _gitname="command-t"
  cd "$srcdir/command-t-$pkgver/"

  local _installprefix="${pkgdir}/usr/share/vim/vimfiles"
  install -m755 -d "${_installprefix}"/{"autoload",doc,plugin,"ruby/${_gitname}"/{vim,finder,scanner{,/file_scanner}}}
  install -m644 -t "${_installprefix}/autoload"                        "autoload"/*.vim
  install -m644 -t "${_installprefix}/doc"                        "doc"/*.txt
  install -m644 -t "${_installprefix}/plugin"                     "plugin"/*.vim
  install -m644 -t "${_installprefix}/ruby"                       "ruby/"*.rb
  install -m644 -t "${_installprefix}/ruby/${_gitname}"           "ruby/${_gitname}"/*.{rb,so}
  install -m644 -t "${_installprefix}/ruby/${_gitname}/vim"       "ruby/${_gitname}/vim"/*.rb
  install -m644 -t "${_installprefix}/ruby/${_gitname}/finder"    "ruby/${_gitname}/finder"/*.rb
  install -m644 -t "${_installprefix}/ruby/${_gitname}/scanner"   "ruby/${_gitname}/scanner"/*.rb
  install -m644 -t "${_installprefix}/ruby/${_gitname}/scanner/file_scanner"  "ruby/${_gitname}/scanner/file_scanner"/*.rb

  # install license files
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

# vim:set ts=2 sw=2 et:
