# Maintainer: Guillaume Gauvrit <guillaume@gauvr.it>
pkgname=rustaman-git
pkgver=0.0.4af1e14
pkgrel=1
pkgdesc="Template based HTTP client"
arch=('i686' 'x86_64')
url="https://github.com/mardiros/rustaman"
license=('BSD')
makedepends=('cargo' 'git')
depends=('gtk3' 'gtksourceview3' 'openssl')
options=('!emptydirs' '!strip')
source=("$pkgname::git+https://github.com/mardiros/rustaman.git")
sha1sums=('SKIP')



build() {
  cd "$pkgname"
  cargo build --release
}

pkgver() {
  cd "$pkgname"
  #local tag=$(git tag --sort=-v:refname | grep '^[0-9]' | head -1)
  local tag="0.0"
  local commits_since=$(git rev-list $tag..HEAD --count)
  echo "$tag.r$commits_since.$(git log --pretty=format:'%h' -n 1)"
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/rustaman" "$pkgdir/usr/bin/rustaman"

  install -Dm644 "assets/rustaman-dark.xml" "$pkgdir/usr/share/rustaman/rustaman-dark.xml"
  install -Dm644 "assets/rustaman-request.lang" "$pkgdir/usr/share/rustaman/rustaman-request.lang"
  install -Dm644 "assets/rustaman-response.lang" "$pkgdir/usr/share/rustaman/rustaman-response.lang"
}
