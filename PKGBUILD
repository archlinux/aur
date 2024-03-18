pkgname=hyprdots-ctl-git
pkgver=v0.4.0.r39.g38d5c70
pkgrel=1
pkgdesc="CLI for Hyprdots Configurations ++ Hidden Gems"
arch=('x86_64')
url="https://github.com/kRHYME7/Hyprdots-ctl"
license=('GPL3')
depends=( 'fzf' 'tree' 'ttf-jetbrains-mono-nerd' )
makedepends=('git' 'make' 'curl' 'base-devel')
source=("git+https://github.com/kRHYME7/Hyprdots-ctl.git")
md5sums=('SKIP')
conflicts=("hyprdots-ctl")


# pkgver() { 
#   cd "$srcdir/Hyprdots-ctl" || return
#   git fetch --tags
#   git describe --long --tags --always | sed 's/-/./g' # Replace hyphens with dots to conform to versioning standards
# }

# pkgver() { 
#  cd "$srcdir/Hyprdots-ctl" || return
#  git fetch --tags
#  # Use git describe with a fallback to the commit hash if no tags are found
#  local version=$(git describe --tags --always --dirty 2>/dev/null)
#  # Replace hyphens with dots to conform to versioning standards
#  echo "$version" | sed 's/-/./g'
# }

pkgver() {
 git -C "${srcdir}/Hyprdots-ctl" describe --long --tags --always | sed 's/\([^-]*-g[0-9a-f]*\)/r\1/;s/[-+]/./g'
}


package() {
    cd "${srcdir}/Hyprdots-ctl" || return
    make DESTDIR="$pkgdir" clean all
}
