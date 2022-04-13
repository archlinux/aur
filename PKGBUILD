# Maintainer: Gunar C. Gessner <gunar@gunar.uk>
_pkgname="difftastic"
pkgname="${_pkgname}-git"
pkgver=0.26.3.r5.92b3c6e93
pkgrel=1
pkgdesc="a diff that understands syntax"
arch=("i686" "x86_64")
url="https://github.com/Wilfred/difftastic"
license=('MIT')
groups=()
depends=('gcc-libs')
makedepends=('git' 'cargo')
optdepends=()
provides=('difft')
conflicts=('difft')
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+http://github.com/Wilfred/${_pkgname}.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  local tag=$(git tag --sort=-v:refname | grep '^[0-9]' | head -1)
  local commits_since=$(git rev-list $tag..HEAD --count)
  echo "$tag.r$commits_since.$(git log --pretty=format:'%h' -n 1)"
}

build() {
  cd "$pkgname"
  cargo build --release
}

package() {
  cd "$pkgname"
  install -D -m 755 "target/release/difft" "${pkgdir}/usr/bin/difft"
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
