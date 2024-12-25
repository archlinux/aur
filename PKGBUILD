# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=authbind-git
pkgver=2.1.2.r17.g33818c4
pkgrel=1
pkgdesc="Allows non-root programs to bind() to low ports"
arch=('i686' 'x86_64')
url="https://tracker.debian.org/pkg/authbind"
license=('GPL-2.0-or-later')
depends=('glibc')
makedepends=('git')
provides=("authbind=$pkgver")
conflicts=('authbind')
source=("git+https://www.chiark.greenend.org.uk/ucgi/~ian/githttp/authbind.git")
sha256sums=('SKIP')


pkgver() {
  cd "authbind"

  _tag=$(git tag -l --sort -v:refname | grep -E '^debian/[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's|^debian/||'
}

build() {
  cd "authbind"

  make \
    prefix="/usr"
}

package() {
  cd "authbind"

  make \
    DESTDIR="$pkgdir" \
    prefix="/usr" \
    install \
    install_man
}
