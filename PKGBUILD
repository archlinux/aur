# Maintainer: alcalino alanhumber333@gmail.com
pkgname='pacmanagergui-git' # '-bzr', '-git', '-hg' or '-svn'
pkgdir='pacmanager' #Name of the actual git repo used for cd
pkgver=r33.c47a830
pkgrel=1
pkgdesc="Simple GUI wrapper for the pacman package manager"
arch=('x86_64')
url="https://github.com/alcalino-git/pacmanager"
license=('MIT-0')
depends=('gtk4' 'pacman' 'boost' 'glibc' 'glib2' 'meson')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
install=
source=('pacmanager::git+https://github.com/alcalino-git/pacmanager.git')
sha256sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
        cd pacmanager
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
        cd pacmanager
        meson setup build
        meson compile -C build
}

package() {
        cd pacmanager
        install -Dm755 ./build/pacmanager "$pkgdir/usr/bin/pacmanager"
}
