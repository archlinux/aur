# Maintainer: Visne <visne2 at proton dot me>
# Contributor: Lukas Harbauer <lukas.harbauer@mailbox.org>
pkgname=visicut-git
pkgver=2.0.r7.g4054819
pkgrel=1
pkgdesc='A user-friendy, platform-independent tool for preparing, saving and sending jobs to laser cutters.'
arch=('any')
url='https://visicut.org/'
license=('LGPL-3.0-or-later')
depends=('java-runtime=11')
makedepends=('maven' 'git')
provides=('visicut')
source=("$pkgname::git+https://github.com/t-oster/VisiCut.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --match "[0-9]*" --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    git submodule update --init --recursive
}

build() {
    cd "$pkgname"
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir/" install
}
