# Maintainer: Eli Schwartz <eschwartz93@gmail.com>
# Contributor: Joris Steyn <jorissteyn@gmail.com>
# Contributor: Curtis McEnroe <programble@gmail.com>

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

pkgname=git-extras-git
pkgver=4.3.0.r0.g88ee400
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
    make DESTDIR="${pkgdir}" PREFIX=/usr SYSCONFDIR=/etc install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
