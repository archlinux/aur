# Maintainer: Eli Schwartz <eschwartz93@gmail.com>
# Contributor: Joris Steyn <jorissteyn@gmail.com>
# Contributor: Curtis McEnroe <programble@gmail.com>
pkgname=git-extras-git
pkgver=4.0.0.r10.ge7083de
pkgrel=2
pkgdesc="GIT utilities -- repo summary, repl, changelog population, author commit percentages and more"
arch=('any')
url="https://github.com/tj/${pkgname%-git}"
license=('custom:MIT')
depends=('git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git://github.com/tj/${pkgname%-git}.git")
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
