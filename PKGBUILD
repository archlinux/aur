# Maintainer: Robert Schiele <rschiele@gmail.com>

pkgname=git-incrypt-git
pkgver=0.9.0.r8.gaa933c2
pkgrel=1
pkgdesc="A git remote helper to encrypt git repositories incrementally"
arch=('any')
url="https://github.com/schiele/git-incrypt/"
license=('GPL2')
depends=('git' 'python-pygit2' 'gnupg')
makedepends=('asciidoc' 'xmlto' 'python-pylint' 'python-pycodestyle' 'man')
source=("git+https://github.com/schiele/git-incrypt.git")
sha256sums=('SKIP')

pkgver() {
    cd git-incrypt
    git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd git-incrypt
    make clean
    make
}

check() {
    cd git-incrypt
    cat <<EOF > tmp_gitconfig
[user]
	name = Test User
	email = test@test.test
EOF
    GIT_CONFIG_GLOBAL="$PWD/tmp_gitconfig" make test
}

package() {
    cd git-incrypt
    make PKGNAME:="$pkgname" DESTDIR:="$pkgdir" install
}
