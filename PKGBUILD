# Maintainer: envolution
# Contributor: Jose Riha <jose1711 gmail com>
#
pkgname=cycle-git
pkgver=0.3.3+r29+gb9671a71d
pkgrel=2
pkgdesc="Cycle is a calendar program for women (git)"
arch=('any')
url="https://github.com/metlov/cycle"
license=('GPL')
depends=('python' 'python-wxpython')
makedepends=('git')
source=($pkgname::"git+https://github.com/metlov/cycle.git" cycle.desktop cycle)
md5sums=('SKIP'
         '2ce056808512dcdf55f0375b159ae6b1'
         'c53b13c42bea26abbeeb341be0eeab9d')

pkgver() {
  cd "$srcdir/$pkgname"
  _version=$(git tag --sort=-v:refname --list | grep '^v[0-9.]*$' | head -n1 | cut -c2-)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version}+r${_commits}+g${_short_commit_hash}"
}

package() {
  install -D -m755 $srcdir/cycle ${pkgdir}/usr/bin/cycle
  install -Dm644 $srcdir/cycle.desktop $pkgdir/usr/share/applications/cycle.desktop
  cd "$srcdir/$pkgname"

  mkdir -p ${pkgdir}/usr/share/{cycle,man/man1}
  cp -pR * ${pkgdir}/usr/share/cycle
  mv cycle.1 ${pkgdir}/usr/share/man/man1
  install -Dm644 README* -t $pkgdir/usr/share/doc/cycle
  install -Dm644 icons/cycle.xpm $pkgdir/usr/share/pixmaps/cycle.xpm
}

# vim:set ts=2 sw=2 et:
