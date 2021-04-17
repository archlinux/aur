# Maintainer: Robby Stokoe <robbystk@gmail.com>
# Contributor: Sebastien Leduc <sebastien@sleduc.fr>
# Contributor: Andrey Vlasovskikh <andrey.vlasovskikh@gmail.com>

pkgname="vim-command-t"
pkgver=5.0.3
pkgrel=1
pkgdesc="an extremely fast, intuitive mechanism for opening files and buffers with a minimal number of keystrokes"
arch=("i686" "x86_64")
url="https://wincent.com/products/command-t"
license=("BSD")
groups=("vim-plugins")
depends=("vim" "ruby")
install="vimdoc.install"

source=("https://github.com/wincent/Command-T/archive/$pkgver.tar.gz")
sha256sums=('33ed18497ed117186b727a2608e2c4b96d312c7581ec7175b869f953ea17bfc8')

build() {
  cd "$srcdir/command-t-$pkgver/ruby/command-t/ext/command-t"

  ruby "extconf.rb"
  make
}

package() {
  local _gitname="command-t"
  cd "$srcdir/command-t-$pkgver/"

  local _installprefix="${pkgdir}/usr/share/vim/vimfiles"
  install -m755 -d "${_installprefix}"/{autoload{,/commandt},doc,plugin,"ruby/${_gitname}"/{,bin,ext{,"/${_gitname}"},lib{,"/${_gitname}/"{,vim,metadata,finder,scanner{,/file_scanner}}}}}
  install -m644 -t "${_installprefix}/autoload"                   "autoload"/*.vim
  install -m644 -t "${_installprefix}/autoload/commandt"          "autoload"/commandt/*.vim
  install -m644 -t "${_installprefix}/doc"                        "doc"/*.txt
  install -m644 -t "${_installprefix}/plugin"                     "plugin"/*.vim
  install -m644 -t "${_installprefix}/ruby/${_gitname}"           "ruby/${_gitname}"/*.gemspec
  install -m644 -t "${_installprefix}/ruby/${_gitname}/bin"       "ruby/${_gitname}/bin"/commandtd
  install -m644 -t "${_installprefix}/ruby/${_gitname}/ext/${_gitname}"  "ruby/${_gitname}/ext/${_gitname}"/*.so
  install -m644 -t "${_installprefix}/ruby/${_gitname}/lib"                       "ruby/${_gitname}/lib"/*.rb
  install -m644 -t "${_installprefix}/ruby/${_gitname}/lib/${_gitname}"           "ruby/${_gitname}/lib/${_gitname}"/*.rb
  install -m644 -t "${_installprefix}/ruby/${_gitname}/lib/${_gitname}/vim"       "ruby/${_gitname}/lib/${_gitname}/vim"/*.rb
  install -m644 -t "${_installprefix}/ruby/${_gitname}/lib/${_gitname}/finder"    "ruby/${_gitname}/lib/${_gitname}/finder"/*.rb
  install -m644 -t "${_installprefix}/ruby/${_gitname}/lib/${_gitname}/metadata"  "ruby/${_gitname}/lib/${_gitname}/metadata"/*.rb
  install -m644 -t "${_installprefix}/ruby/${_gitname}/lib/${_gitname}/scanner"   "ruby/${_gitname}/lib/${_gitname}/scanner"/*.rb
  install -m644 -t "${_installprefix}/ruby/${_gitname}/lib/${_gitname}/scanner/file_scanner"  "ruby/${_gitname}/lib/${_gitname}/scanner/file_scanner"/*.rb

  # install license files
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

# vim:set ts=2 sw=2 et:
