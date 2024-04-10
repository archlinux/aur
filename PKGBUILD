# Maintainer: Cravix <dr dot neemous at gmail dot com>
# Based on community/vim-jedi PKGBUILD by Levente Polyak <anthraxx[at]archlinux[dot]org>
# check part doesn't work so directly removed it :p if you know how to fix it please tell me :)

pkgname=vim-python-mode
_pkgname=python-mode
pkgver=0.13.0
pkgrel=2
pkgdesc='A vim plugin that make vim into python IDE'
arch=('any')
license=('LGPL3')
url='https://github.com/python-mode/python-mode'
depends=('vim' 'python' 'python-astroid' 'autopep8' 'python-mccabe' 'python-pycodestyle' 'python-pydocstyle' 'python-pyflakes' 'python-pylint' 'python-rope' 'python-six' 'python-snowballstemmer' 'pylama')
#pylama' '
groups=('vim-plugins')
source=("https://github.com/${_pkgname}/${_pkgname}/archive/${pkgver}.tar.gz"
	"1-fix-pylama-linters.patch")
sha256sums=('1d0812ebfe5850b298502c37ceff1b30cb492550995f0c9612a0a8df09f17d9f'
            '9f7bc8e24c1a4fe2f1e158e69817f57805f25f81802b7b056d06603f7c38dc22')
prepare() {
	cd "${_pkgname}-${pkgver}"
	patch -p1 -i ../1-fix-pylama-linters.patch
}

package() {
  cd "${_pkgname}-${pkgver}"

  install -d "${pkgdir}/usr/share/vim/vimfiles"
  cp -dpr --no-preserve=ownership pymode "${pkgdir}/usr/share/vim/vimfiles"
  cp -dpr --no-preserve=ownership after "${pkgdir}/usr/share/vim/vimfiles/after"
  cp -dpr --no-preserve=ownership autoload "${pkgdir}/usr/share/vim/vimfiles/autoload"
  cp -dpr --no-preserve=ownership doc "${pkgdir}/usr/share/vim/vimfiles/doc"
  cp -dpr --no-preserve=ownership ftplugin "${pkgdir}/usr/share/vim/vimfiles/ftplugin"
  cp -dpr --no-preserve=ownership plugin "${pkgdir}/usr/share/vim/vimfiles/plugin"
  cp -dpr --no-preserve=ownership syntax "${pkgdir}/usr/share/vim/syntax"

  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
