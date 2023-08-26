# Maintainer: GreyXor <greyxor@protonmail.com>
# Contributor: Drew DeVault <sir@cmpwn.com>
# Contributor: Antonin Décimo <antonin dot decimo at gmail dot com>

pkgname=sway-contrib-git
pkgver=r6.c6f601b
pkgrel=1
arch=('x86_64')
pkgdesc='A collection of user-contributed scripts for sway'
url='https://swaywm.org/'
license=('MIT')
depends=(
    "sway"
    "python-i3ipc"
    "grim"
    "slurp"
    "wl-clipboard"
    "jq"
    "libnotify"
)
makedepends=("git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/OctopusET/sway-contrib.git")
b2sums=('SKIP')

pkgver() {
    # Calculate the version dynamically using git information
    printf "r%s.%s" "$(git -C "$srcdir/${pkgname}" rev-list --count HEAD)" "$(git -C "$srcdir/${pkgname}" rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname}"
  install -d "${pkgdir}/usr/share/${pkgname%-git}"

  find . -type f -not -path './.git/*' -exec install {} "${pkgdir}/usr/share/${pkgname%-git}" \;
}
