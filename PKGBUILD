# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=ncurses-life
pkgver=20091024
pkgrel=2
pkgdesc="Random Conway's game of life in your terminal."
arch=('any')
url="http://csiuo.com/drupal/content/ncurses-life"
license=('custom:copyright')
depends=('perl-curses')
source=(http://csiuo.com/drupal/content/ncurses-life)
md5sums=('f55af73a004b6c049e8da97173fefb7d')

build() {
  cd "$srcdir"
  # scary...
  ncl=$(sed -n '/#!\/usr\/bin\/perl/,/endwin/p' ncurses-life)
  ncl=$(sed 's/<[^>]*>//g' <<< "$ncl")
  ncl=$(sed 's/&nbsp;/ /g' <<< "$ncl")
  ncl=$(sed   's/&gt;/>/g' <<< "$ncl")
  ncl=$(sed   's/&lt;/</g' <<< "$ncl")
  ncl=$(sed  's/&#40;/(/g' <<< "$ncl")
  ncl=$(sed  's/&#41;/)/g' <<< "$ncl")
  ncl=$(sed 's/&#123;/{/g' <<< "$ncl")
  ncl=$(sed 's/&#125;/}/g' <<< "$ncl")
  ncl=$(sed  's/&#91;/[/g' <<< "$ncl")
  ncl=$(sed  's/&#93;/]/g' <<< "$ncl")
  echo "$ncl" > nclife
}

package() {
  cd "$srcdir"
  install -Dm755 nclife "$pkgdir/usr/bin/ncurses-life"
}


