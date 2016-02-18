# Maintainer: XZS <d dot f dot fischer at web dot de>

pkgname=vim-hilinktrace-git
pkgver=r1.64da6bf
pkgrel=1
pkgdesc="vim plugin to trace syntax highlight"
arch=('any')
url="https://github.com/gerw/vim-HiLinkTrace"
license=('custom:vim')
groups=('vim-plugins')
depends=("vim")
install=vimdoc.install

makedepends+=('git')
source+=("${_gitname:=${pkgname%-git}}::${_giturl:-git+$url}")
md5sums+=('SKIP')
provides+=("$_gitname=$pkgver")
conflicts+=("$_gitname")
pkgver() {
  cd ${_gitname:-$pkgname}
  git describe --long --tags 2>/dev/null | sed 's/[^[:digit:]]*\(.\+\)-\([[:digit:]]\+\)-g\([[:xdigit:]]\{7\}\)/\1.r\2.g\3/;t;q1'
  [ ${PIPESTATUS[0]} -ne 0 ] && \
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package()
{
  cd "$_gitname"
  install -Dm644 -t ${pkgdir}/usr/share/vim/vimfiles/doc doc/*.txt
  install -Dm644 -t ${pkgdir}/usr/share/vim/vimfiles/plugin plugin/*.vim
}
