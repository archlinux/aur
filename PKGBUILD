# Contributor: anekos <anekos@snca.net>
_pkgname=percol
pkgname=$_pkgname-git
pkgver=20190724.409
pkgrel=1
pkgdesc="percol adds flavor of interactive selection to the traditional pipe concept on UNIX"
url="https://github.com/mooz/percol"
arch=('i686' 'x86_64')
license=('MIT')
depends=('python' 'python-six' 'python-setuptools')
makedepends=('git')
optdepends=('python-cmigemo')
provides=('percol')
conflicts=('percol')
source=("$_pkgname::git+https://github.com/mooz/percol.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
}

package () {
  cd $srcdir/$_pkgname
  python setup.py install --root="$pkgdir/"
  install -Dm0644 "$srcdir/$_pkgname/tools/zsh/_percol" "$pkgdir/usr/share/zsh/site-functions/_percol"
  install -Dm0644 "$srcdir/$_pkgname/tools/zsh/percol.zsh" "$pkgdir/usr/share/zsh/plugins/percol/percol.plugin.zsh"
}

# vim:set ts=2 sw=2 et:
