pkgname=devexcuse-git
pkgver=r5.e0b820f
pkgrel=1
pkgdesc="This script will fetch a random developer excuse from the web while also keeping an offline database."
url="https://github.com/K4R7IK/DevExcuse"
depends=('curl' 'jq')
arch=('any')

source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "DevExcuse"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}


package() {
    cd "${srcdir}/DevExcuse"

    install -Dm755 devexcuse.sh "${pkgdir}/usr/bin/devexcuse"
}
