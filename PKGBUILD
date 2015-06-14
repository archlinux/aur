# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>
_pkgname=textios
pkgname=$_pkgname-git
pkgver=15.03
pkgrel=1
pkgdesc="Text interface to Icinga and Nagios"
arch=('any')
url='https://github.com/vain/textios'
license=('custom:PIZZA-WARE')
depends=('python2' 'curl' 'vim')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(git://github.com/vain/textios.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|-|.|g; s|v||'
}

package() {
  cd "$srcdir/$_pkgname"

  # textios is split into several executables and that list might change
  # a lot.
  for i in *
  do
    [[ -f $i && -x $i ]] && install -Dm755 "$i" "$pkgdir"/usr/bin/"$i"
  done

  install -Dm644 vim/textios.vim \
    "$pkgdir"/usr/share/vim/vimfiles/ftdetect/textios.vim
  install -Dm644 man/man1/textios.1 "$pkgdir"/usr/share/man/man1/textios.1
  install -Dm644 man/man1/htmlios.1 "$pkgdir"/usr/share/man/man1/htmlios.1
  install -Dm644 man/man5/textiosrc.5 "$pkgdir"/usr/share/man/man5/textiosrc.5
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
