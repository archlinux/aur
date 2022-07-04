# Maintainer: littzhch <2371050115@qq.com>

pkgname=oh-my-zsh-plugin-syntax-highlighting
_pkgname=zsh-syntax-highlighting
pkgver=0.7.1
pkgrel=1
pkgdesc="Fish shell-like syntax highlighting for oh-my-zsh"
arch=('any')
url="https://github.com/zsh-users/zsh-syntax-highlighting"
license=('BSD')
depends=('zsh' 'oh-my-zsh-git')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('e7e86b88cdac9b9ed5f973823ba8efff99dd720b9ed929f765f9f9266b9d6e147274f5957ceb630d51a660e396fc22e97f10cfbc5cdde941b907f3773bb1ea2b')


build() {
    cd "$_pkgname-$pkgver"
    make
}

package() {
  cd "$_pkgname-$pkgver"
  
  make PREFIX="/usr" SHARE_DIR="${pkgdir}/usr/share/oh-my-zsh/custom/plugins/${_pkgname}/" DESTDIR="${pkgdir}" install
  # create symlink for using with oh-my-zsh
  ln -s "zsh-syntax-highlighting.zsh" \
       "${pkgdir}/usr/share/oh-my-zsh/custom/plugins/${_pkgname}/zsh-syntax-highlighting.plugin.zsh"

  # licence
  install -dm755 "${pkgdir}/usr/share/licenses/$_pkgname"
  ln -s "/usr/share/doc/$_pkgname/COPYING.md" \
        "${pkgdir}/usr/share/licenses/$_pkgname/COPYING"
}