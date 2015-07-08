# Maintainer: OmeGa <omega [U+0040] mailoo [.] org>
# Contributor: Kevin Dodd <Jesin00@gmail.com>
# Contributor: Pablo Lezaeta <prflr@gmail.com>

pkgname=grml-zsh-config-git
pkgver=0.9.3.r0.ge3306f3
pkgrel=1
pkgdesc="Grml's zsh setup."
arch=('any')
url="http://grml.org/zsh/"
license=('GPL')
depends=('coreutils' 'grep' 'inetutils' 'procps' 'sed' 'zsh')
makedepends=('git' 'txt2tags')
conflicts=('grml-zsh-config')
provides=('grml-zsh-config' 'grmlzshrc')
source=("$pkgname"::'git://github.com/grml/grml-etc-core.git')
sha1sums=('SKIP')

pkgver(){
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname/doc"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm644 etc/skel/.zshrc "$pkgdir/etc/skel/.zshrc"
  install -Dm644 etc/zsh/keephack "$pkgdir/etc/zsh/keephack"
  install -Dm644 etc/zsh/zshrc "$pkgdir/etc/zsh/zshrc"

  install -Dm644 doc/grmlzshrc.5 "$pkgdir/usr/share/man/man5/grmlzshrc.5"
  ln -sf grmlzshrc.5.gz "$pkgdir/usr/share/man/man5/grml-zsh-config.5.gz"
}

# vim:set ts=2 sw=2 et:
