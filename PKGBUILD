# Maintainer: Will Price <will.price94+aur@gmail.com>
pkgname=pug-git
pkgver() {
  cd "${pkgname%%-git}"
  git describe --long | sed -r 's/-([0-9,a-g,A-G]{7}.*)//' | sed 's/-/./'
}
pkgver=v0.4.0.2
pkgrel=1
pkgdesc="Quickly update local projects and their dependencies with a
single command"
arch=('any')
url="https://github.com/ashur/pug"
license=('github')
depends=('php')
optdepends=('git' 'subversion' 'composer')
md5sums=('SKIP')
source=("${pkgname%%-git}::git+https://github.com/ashur/pug.git")
prepare() {
	cd "$srcdir/${pkgname%%-git}"
    git submodule init
    git submodule update
}

package() {
	cd "$srcdir/${pkgname%%-git}"
    mkdir -p "$pkgdir"/usr/{bin,share/pear}
    cp -r "$srcdir/${pkgname%%-git}" "$pkgdir/usr/share/pear/"
    ln -s /usr/share/pear/pug/pug "$pkgdir/usr/bin"
}
