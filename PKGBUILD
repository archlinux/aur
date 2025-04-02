# Maintainer: Jah Way <jahway603 at protonmail dot com>
pkgname=goman-git
_pkgname=goman
pkgver=0.4.0.r4.ged8e53a
pkgrel=1
pkgdesc="Fetches the repo's readme as a man page replacement."
arch=(i686 x86_64)
url="https://github.com/appliedgocode/goman"
license=('custom')
depends=('go')
conflicts=('goman' 'goman-bin')
provides=('goman')
source=("git+$url"
        "https://raw.githubusercontent.com/appliedgocode/goman/master/LICENSE.txt")
sha256sums=('SKIP'
            '00c7eaf22064ba6b41caa08390f90018c21516c7b172b94b913bb2eb177f78c1')

# https://wiki.archlinux.org/title/VCS_package_guidelines
pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  go mod tidy
}

build() {
  cd "$srcdir/${pkgname%-git}"
  go build
}

package() {
  cd $srcdir/$_pkgname
  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
