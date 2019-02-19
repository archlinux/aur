# Maintainer: Emmanuel Gil Peyrot <emmanuel.peyrot@collabora.com>

_pkgname=git-phab
pkgname=git-phab-git
pkgver=r187.6877964
pkgrel=1
pkgdesc="Git subcommand to integrate with phabricator"
arch=('any')
url='https://pypi.org/project/git-phab/'
license=('GPL2')
depends=('python-gitpython' 'python-phabricator' 'python-argcomplete' 'python-appdirs')
provides=("$_pkgname")
conflicts=("$_pkgname")
makedepends=('git' 'asciidoc')
source=("$_pkgname::git://anongit.freedesktop.org/git/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  a2x --doctype manpage --format manpage git-phab.txt
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 git-phab "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 git-phab.1 "$pkgdir/usr/share/man/man1/$_pkgname.1"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README"
}
