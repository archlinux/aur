# Maintainer: Doug Newgard <scimmia at archlinux dot info>

_pkgname=polkit-efl
pkgname=$_pkgname-git
pkgver=0.1.r72.b814ee2
pkgrel=1
pkgdesc="Polkit Authentication Agent using EFL"
arch=('any')
url="http://www.enlightenment.org"
license=('GPL3')
depends=('python-efl' 'polkit')
makedepends=('git')
optdepends=('python-psutil: For process details')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "polkit-efl-authentication-agent-git")
source=("git://git.enlightenment.org/misc/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  printf "$(python setup.py -V).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  sed -i 's|libexec|lib/polkit-efl|' "$srcdir/$_pkgname/setup.py"
}

build() {
  cd "$srcdir/$_pkgname"

  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"

  python setup.py install --root="$pkgdir"
}
