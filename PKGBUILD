# Maintainer: theguy147 <yakamoz147 (at) protonmail (dot) com>
pkgname=buffalo-git
pkgver=v0.16.13.r0.g0260f6e5
pkgrel=1
pkgdesc='A Go web development eco-system, designed to make your project easier. (git version)'
arch=('x86_64')
url="https://github.com/gobuffalo/buffalo/"
license=('MIT')
makedepends=('git')
depends=('go>=1.13')
optdepends=('nodejs>=8: frontend'
            'npm: asset pipeline'
            'yarn: frontend dependency management'
            'gcc: for building sqlite3 support'
            'git: for VCS support')
conflicts=('buffalo-bin')
source=("$pkgname::git+https://github.com/gobuffalo/buffalo.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    go build -o dist/buffalo ./buffalo
}

package() {
    cd "$pkgname"
    install -Dm755 "dist/buffalo" "$pkgdir/usr/bin/buffalo"
    install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/buffalo/LICENSE"
}
