# Contributor: Xinkai <yeled.nova@gmail.com>
# Maintainer: xgdgsc <xgdgsc at gmail.com>

pkgname="xware-desktop-git"
_gitname=XwareDesktop
pkgdesc="An attempt to bring Xware (Xunlei on routers) to desktop Linux."
pkgrel=1
pkgver=486.4e4b0e7
arch=("i686" "x86_64")
conflicts=("xware-desktop" 'xware_desktop' 'xware_desktop-git')
replaces=("xware-desktop"  'xware_desktop' 'xware_desktop-git')
license=("GPL" "custom")
url="https://github.com/Xinkai/XwareDesktop"
makedepends=("git" "python-pyqt5" "coffee-script" "chrpath" "findutils")
if test "$CARCH" == x86_64; then
    makedepends+=("gcc-multilib")
else
    makedepends+=("gcc")
fi

depends=("python-pyqt5" "qt5-webkit" "qt5-multimedia" "libcap" "python-requests" "python-pyinotify" "desktop-file-utils")
if test "$CARCH" == x86_64; then
    depends+=("lib32-glibc" "lib32-zlib")
else
    depends+=("glibc" "zlib")
fi

source=('XwareDesktop::git+https://github.com/Xinkai/XwareDesktop.git')
md5sums=('SKIP')

install=xware-desktop.install

pkgver() {
  cd $_gitname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
    cd ${srcdir}/${_gitname}/
    make all
}

package() {
    cd ${srcdir}/${_gitname}/
    make DESTDIR=${pkgdir} install
    #echo -e "\n__githash__ = \"${_commit}\"\n" >> ${pkgdir}/opt/xware-desktop/shared/__init__.py
}
