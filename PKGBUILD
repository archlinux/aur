pkgname=groundcoverify-git
pkgver=0.2.4.r3.g3e67c25
pkgrel=1
pkgdesc="A simple python script which uses DeltaPlugin to turn regular groundcover in morrowind plugins into openmw-style groundcover."
arch=('i686' 'x86_64')
url="https://gitlab.com/bmwinger/groundcoverify"
license=('GPL')
depends=(delta-plugin python)
makedepends=(git)
provides=(groundcoverify)
source=('git+https://gitlab.com/bmwinger/groundcoverify' 'groundcoverify.sh')
sha1sums=('SKIP' '6293100b6b96e13bdff4d6f436838486408d04c8')

pkgver() {
  cd "${srcdir}/groundcoverify"
  _tag="$(git describe --tags $(git rev-list --tags --max-count=1))"
  _numcommits="$(git rev-list $(git rev-list --tags --no-walk --max-count=1)..HEAD --count)"
  _hash="$(git rev-parse --short HEAD)"
  printf "%s.r%s.g%s" "$_tag" "$_numcommits" "$_hash"
}

prepare() {
  cd "${srcdir}/groundcoverify"
}

package() {
  install -Dm0755 "groundcoverify.sh" "$pkgdir/usr/bin/groundcoverify" 
  cd "${srcdir}/groundcoverify"
  install -Dm0755 -t "$pkgdir/usr/share/groundcoverify/" "groundcoverify.py"
  install -Dm0755 -t "$pkgdir/usr/share/groundcoverify/" "groundcoverify.toml"
}
