# Maintainer: Sebastian Reuße <seb@wirrsal.net>
pkgname=git-remote-gcrypt-git
_gitname=git-remote-gcrypt
pkgver=20150101.r1.ge914827
pkgrel=1
pkgdesc="A git remote helper for GPG-encrypted remotes."
arch=(any)
# Currently, there’s no canonical upstream for git-remote-gcrypt. For now,
# use Azulinho’s fork, which provides some commits for GPG2 compatibility.
url=https://github.com/Azulinho/git-remote-gcrypt
license=(GPL)
makedepends=(git python-docutils)
depends=(git gnupg bash)
source=(git+https://github.com/Azulinho/git-remote-gcrypt)
md5sums=(SKIP)


pkgver() {
    cd "$_gitname"
    git describe --long --tags | \
        sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;'
}

build() {
    cd "$srcdir/$_gitname"
    rst2man README.rst | gzip >git-remote-gcrypt.1.gz
}

package() {
    cd "$srcdir/$_gitname"
    install -Dm 755 git-remote-gcrypt "$pkgdir"/usr/bin/git-remote-gcrypt
    install -Dm 644 git-remote-gcrypt.1.gz "$pkgdir"/usr/share/man/man1/git-remote-gcrypt.1.gz
}
