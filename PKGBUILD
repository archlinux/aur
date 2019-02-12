_pkgname=urxvt-perls
pkgname=${_pkgname}-git
pkgver=128.1f4897c
pkgrel=1
pkgdesc="URL and Mouseless text selection for rxvt-unicode"
arch=('any')
url='http://www.github.com/muennich/urxvt-perls'
license=('GPL2')
depends=('rxvt-unicode' 'perl' 'xsel')
provides=("$_pkgname" 'urxvt-url-select' 'urxvt-keyboard-select')
conflicts=("$_pkgname" 'urxvt-url-select' 'urxvt-keyboard-select')
replaces=("$_pkgname" 'urxvt-url-select' 'urxvt-keyboard-select')
install=$_pkgname.install
source=(git://github.com/muennich/urxvt-perls)
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd "$srcdir/$_pkgname"

  install -dm755 "$pkgdir"/usr/lib/urxvt/perl
  install -dm755 "$pkgdir"/usr/lib/urxvt/perl/deprecated
  install -t "$pkgdir"/usr/lib/urxvt/perl/deprecated -m644 deprecated/{clipboard,url-select}
  install -t "$pkgdir"/usr/lib/urxvt/perl -m644 keyboard-select
}
