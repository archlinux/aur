# Maintainer: Jonathan Knapp <jaknapp8+aur@gmail.com>
# URL: https://github.com/pa1nki113r/Project_Brutality
# Upstream: https://github.com/pa1nki113r/Project_Brutality

pkgname=('project-brutality-git')
pkgver=3.0.0.alpha.562.g83a1878d
pkgrel=1
pkgdesc="DOOM overhaul mod, successor to brutal-doom."
arch=('any')
url='https://github.com/pa1nki113r/Project_Brutality'
license=('MIT') # not really
# depends=()
makedepends=('zip')
optdepends=('gzdoom' 'qzdl')
provides=('project-brutality')
# conflicts=()
source=("$pkgname::git+https://github.com/pa1nki113r/Project_Brutality.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  # git describe --tags | sed 's/^v//;s/-/./g'
  echo "3.0.0.alpha.$(git rev-list --count master).g$(git describe --always)"
}

package() {
  cd "$srcdir"
  rm brutal.zip || echo;
  zip -r "brutal.zip" "$pkgname" -x "*.git*"
  install -Dm 744 "brutal.zip" "$pkgdir/usr/share/games/project-brutality/Project_Brutality-master.pk3";
}
