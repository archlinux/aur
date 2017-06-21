# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Dimitrios Vogiatzis <me@dimtree.net>

pkgname=discord-cli-git
_pkgname=discord-cli
pkgver=r45.57f869f
pkgrel=3
pkgdesc="Minimalistic Command-Line Interface for Discord"
arch=('i686' 'x86_64')
url="https://github.com/Rivalo/discord-cli"
license=('GPL')
depends=('glibc')
makedepends=('go' 'git')
source=("$pkgname::git+https://github.com/Rivalo/discord-cli")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  export GOPATH=$srcdir
  go get github.com/rivalo/discord-cli
  go get github.com/fatih/color
  go get github.com/chzyer/readline
  go get github.com/rivalo/discordgo_cli
  go get github.com/rivalo/discord-cli/DiscordState
}

build() {
  export GOPATH=$srcdir
  cd $pkgname
  go build
}

package() {
  echo packaging
  cd $srcdir
  install -Dm755 "$srcdir/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
