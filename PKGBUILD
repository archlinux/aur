# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Joris Steyn <jorissteyn@gmail.com>
# Contributor: Curtis McEnroe <programble@gmail.com>

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

pkgname=git-extras-git
pkgver=4.7.0.r3.g5b0a9d2
pkgrel=1
pkgdesc="GIT utilities -- repo summary, repl, changelog population, author commit percentages and more"
arch=('any')
url="https://github.com/tj/${pkgname%-git}"
license=('MIT')
depends=('git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${pkgname%-git}"

    # avoid annoying interactive prompts if an alias is in your gitconfig
    export GIT_CONFIG=/dev/null
    make DESTDIR="${pkgdir}" PREFIX=/usr SYSCONFDIR=/etc install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
