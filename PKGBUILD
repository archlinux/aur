# Maintainer: Stephan Koglin-Fischer <stephan dot koglin-fischer at funzt dot dev>
pkgname=dashlane-cli-git
pkgver=v6.2436.0.r7.gbcfde0b
pkgrel=69
pkgdesc="Dashlane CLI GitHub repository version bundled with asdf-vm to ensure using the correct node version."
arch=('x86_64')
url="https://github.com/Dashlane/dashlane-cli"
license=('MIT')
depends=('asdf-vm')
makedepends=('git')
source=("$pkgname::git+$url.git" '.tool-versions' 'commands.sh')
install=".INSTALL"
b2sums=('SKIP'
        '15cd4aecbcf30e547e140204252a8bdf76f1ddc7493bca478d8fbb08359041342c060ad72e8fc2354fe1d2ac691820b7ef04467d2d80638d0082a828c754bd56'
        '60251685340f3bfe5d0c91820f0c218c7012e1ceb686a8381fcacd8b86a6c483fe76e0df22a8d29c7af951ccbeb6149ffcb606ffeda92da305c0c778acee95d4')
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
