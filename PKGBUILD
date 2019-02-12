# Maintainer: Felip Manyer i Ballester <archlinux at res hyphen telae dot cat>
# Contributor: scippio <scippio@berounet.cz>

pkgname=vim-twig-git
pkgver=20190212
pkgrel=2
pkgdesc="Supports Twig templates for vim"
url="https://github.com/lumiliet/vim-twig"
license=('unknow')
arch=('any')
depends=('vim')
source=('git+https://github.com/lumiliet/vim-twig')
sha512sums=('SKIP')

_gitroot="git://github.com/lumiliet/vim-twig.git"
_gitname="vim-twig"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d $_gitname ]] ; then
    ( cd $_gitname && git pull origin; )
    msg "The local files are updated."
  else
    git clone "$_gitroot"
    msg "Checkout ..."
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."
}

package() {
  cd "${srcdir}/${_gitname}"
  for i in ftplugin syntax
  do
    install -dm 755 "${pkgdir}/usr/share/vim/vimfiles/$i"
    install -m 755 "${srcdir}"/"${_gitname}"/$i/* "${pkgdir}"/usr/share/vim/vimfiles/$i
  done
}

