# Maintainer: Stephan Koglin-Fischer <stephan dot koglin-fischer at funzt dot dev>
pkgname=dashlane-cli-git
pkgver=v1.15.1.r0.g8368d87
pkgrel=61
pkgdesc="Dashlane CLI GitHub repository version bundled with asdf-vm to ensure using the correct node version."
arch=('x86_64')
url="https://github.com/Dashlane/dashlane-cli"
license=('MIT')
depends=('asdf-vm')
makedepends=('git')
source=("$pkgname::git+$url.git" '.tool-versions')
install=".INSTALL"
b2sums=('SKIP'
        '7d947ad3269a67f0987a277e10b082931ecce24330e82debd0d147f3ea24a0d9c04a91c0f711fce286a17a789c883bb626685bc08ac78040c28a5ca677a0cbf8')
# option strip is important for dcli to work properly and avoid
# 'Pkg: Error reading from file.' error in production
options=(!strip)

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  $SHELL -c "source ./commands.sh && prepare_commands $srcdir $pkgname"
}

build() {
  $SHELL -c "source ./commands.sh && build_commands $srcdir $pkgname"
}

package() {
  $SHELL -c "source ./commands.sh && package_commands $srcdir $pkgname $pkgdir"
}
