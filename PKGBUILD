# Maintainer: Doug Newgard <scimmia at archlinux dot info>

_pkgname=polkit-efl-authentication-agent
pkgname=$_pkgname-git
pkgver=0.1.r64.b7f2e22
pkgrel=1
pkgdesc="Polkit Authentication Agent using EFL"
arch=('any')
url="http://www.enlightenment.org"
license=('GPL3')
depends=('python-efl>=1.9.99a')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git://git.enlightenment.org/devs/kuuko/$_pkgname.git"
        "polkit-efl.desktop")
sha256sums=('SKIP'
            '8507850d20bbb684aa6707045d2fd44e31764d73904f2d3ed4975b52f0179ce5')

pkgver() {
  cd "$srcdir/$_pkgname"

  printf "$(python setup.py -V).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname/data/theme"

  edje_cc -id images default.edc
}

package() {
  cd "$srcdir/$_pkgname"

  python setup.py install --root="$pkgdir"

  install -Dm644 data/theme/default.edj "$pkgdir/usr/share/polkit-efl/theme/default.edj"
  install -Dm644 "$srcdir/polkit-efl.desktop" "$pkgdir/etc/xdg/autostart/polkit-efl.desktop"
}
