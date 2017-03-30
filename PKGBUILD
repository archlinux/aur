# Maintainer:  <dflemstr@dflemstr-laptop>
pkgname=styx-cli-git
pkgver=v1.0.0.r5.gb7a993e
pkgrel=1
epoch=
pkgdesc="The command-line interface to Spotify Styx"
arch=('any')
url="https://github.com/spotify/styx"
license=('Apache')
groups=()
depends=('java-runtime')
makedepends=('git' 'maven')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=styx-cli-git.install
changelog=
source=("$pkgname::git+https://github.com/spotify/styx.git"
        'styx-cli-git.install'
        'styx')
noextract=()
md5sums=('SKIP'
         '8b90d3191621f29fd431ecc53d9fb1d9'
         'b23e6239c26c8c5ff70f678466a2c976')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  mvn package -am -pl styx-cli -Dmaven.test.skip -Dmaven.javadoc.skip
}

check() {
  cd "$srcdir/$pkgname"
  mvn verify -am -pl styx-cli
}

package() {
  cd "$srcdir"
  install -Dm755 styx -t "$pkgdir/usr/bin"

  cd "$pkgname"
  install -Dm644 styx-cli/target/styx-cli.jar -t "$pkgdir/usr/share/styx-cli"
}

# vim:set ts=2 sw=2 et:
