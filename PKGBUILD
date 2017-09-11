# Maintainer: Sebastian Reuße <seb@wirrsal.net>
pkgname=git-remote-gcrypt-git
_gitname=git-remote-gcrypt
pkgver=1.0.0.r2.gaaa874f
epoch=1
pkgrel=1
pkgdesc="A git remote helper for GPG-encrypted remotes."
arch=(any)
url=https://spwhitton.name/tech/code/git-remote-gcrypt
license=(GPL)
makedepends=(git python-docutils)
depends=(git gnupg bash)
source=(git+https://github.com/spwhitton/git-remote-gcrypt)
md5sums=(SKIP)


pkgver() {
    cd "$_gitname"
    git describe --long --tags --match "[[:digit:]]*" | \
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
