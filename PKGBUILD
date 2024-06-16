# Maintainer: a821
# Contributor: Ian D. Scott <ian perebruin.com>
# Contributor: Kamil Stachowski <kamil.stachowski gmail.com>

pkgname=git-ftp-git
pkgver=1.6.0.r8.g3465417
pkgrel=1
pkgdesc="Uses Git to upload only changed files to FTP servers"
url='https://github.com/git-ftp/git-ftp'
arch=('any')
license=('GPL-3.0-or-later')
depends=('curl' 'git' 'bash' 'coreutils' 'gawk' 'sed')
makedepends=('pandoc-cli')
optdepends=('lftp: for experimental features')
provides=('git-ftp')
conflicts=('git-ftp')
source=("git+${url}")
md5sums=('SKIP')

pkgver() {
    cd ${pkgname%-git}
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd ${pkgname%-git}/man
    pandoc -s -t man -o git-ftp.1 git-ftp.1.md
}

package() {
    cd ${pkgname%-git}
    install -Dm755 -t "${pkgdir}/usr/bin" git-ftp
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" AUTHORS {CHANGELOG,INSTALL,README}.md
    install -Dm644 -t "${pkgdir}/usr/share/man/man1" man/git-ftp.1
}
# vim: set ts=4 sw=4 et:
