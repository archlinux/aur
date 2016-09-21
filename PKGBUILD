# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=vundle
_gitname=Vundle.vim
pkgver=0.10.2
pkgrel=2
pkgdesc='Plug-in manager for Vim'
url='https://github.com/VundleVim/Vundle.vim'
arch=('any')
license=('MIT')
depends=('vim>=7.0')
install=vundle.install
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/VundleVim/Vundle.vim/archive/v${pkgver}.tar.gz)
sha512sums=('4a06e6600956cccb4db2852812a100ae31f499b11fe1a4a0d524da84a51c5e1f267770fe8032d8a28b4fb3f6313a2b8f087e277a65fd4a4d507aa4e7d87a96ea')

prepare() {
  cd ${_gitname}-${pkgver}
  sed -r 's|(set rtp)|" \1|' -i README.md
}

package() {
  cd ${_gitname}-${pkgver}

  vimpath="${pkgdir}/usr/share/vim/vimfiles"
  mkdir -p "${vimpath}/doc"
  cp -R doc "${vimpath}"
  mkdir -p "${vimpath}/autoload"
  cp -R autoload "${vimpath}"

  install -Dm 644 LICENSE-MIT.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim: ts=2 sw=2 et:
