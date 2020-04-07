# Maintainer: Jonathan Knapp <jaknapp8+aur@gmail.com>
# URL: https://github.com/saegiru/UltimateDoomVisor
# Upstream: https://github.com/saegiru/UltimateDoomVisor

pkgname=('ultimate-doom-visor-git')
pkgver=0.0.5.ge3d9116
pkgrel=1
pkgdesc="DOOM hud mod that supports brutal-doom and project brutality."
arch=('any')
url='https://github.com/saegiru/UltimateDoomVisor'
# license=('MIT') # not really
# depends=()
makedepends=('zip')
optdepends=('gzdoom' 'qzdl' 'project-brutality')
provides=('ultimate-doom-visor')
# conflicts=()
source=("$pkgname::git+https://github.com/saegiru/UltimateDoomVisor.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  # git describe --tags | sed 's/^v//;s/-/./g'
  echo "0.0.$(git rev-list --count master).g$(git describe --always)"
}

package() {
  cd "$srcdir"
  rm udv.zip || true;
  zip -r "udv.zip" "$pkgname" -x "*.git*"
  install -Dm 744 "udv.zip" "$pkgdir/usr/share/games/project-brutality/UltimateDoomVisor-master.pk3";
}
