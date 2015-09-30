# Maintainer : Antonio Orefice <xt7player@gmail.com>

pkgname=kingbash-gb-git
pkgver=20150930
pkgrel=1
pkgdesc="Menu driven auto-completion for bash terminals under X"
arch=('any')
url="https://github.com/kokoko3k/kingbash-gb"
license=('gpl')

depends=(
	'bash'
	'gambas3-gb-desktop>=3.6.2'
	'gambas3-gb-desktop-x11'
	'gambas3-gb-form>=3.6.2'
	'gambas3-gb-image>=3.6.2'
	'gambas3-gb-qt4>=3.6.2'
	)

makedepends=('gambas3-devel' 'git')

_gitroot="https://github.com/kokoko3k/kingbash-gb"

build() {
  cd $srcdir
  rm -Rf $srcdir/kingbash-gb &>/dev/null || echo "No old repository found, proceding to git clone..."
  git clone --depth 1 $_gitroot || return 1

  cd $srcdir/kingbash-gb

  gbc3 -e -a -g -t -p -m
  gba3
}

package() {
  cd kingbash-gb
  install -d ${pkgdir}/usr/bin
  install -m755 kingbash-gb.gambas ${pkgdir}/usr/bin/kingbash-gb.gambas
}

install=kingbash-gb.install
