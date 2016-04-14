# Maintainer: Chris Down <chris@chrisdown.name>
# Contributor: Vladimir Chizhov <jagoterr@gmail.com>
# Contributor: Jochen Schalanda <jochen+aur (-AT-) schalanda.name>
# Contributor: Ichimonji10 <Ichimonji10@gmail.com>
pkgname=rbenv
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple Ruby version manager"
arch=('any')
url="https://github.com/rbenv/rbenv"
license=('MIT')
depends=()
optdepends=('ruby-build')
conflicts=('rbenv-git')
install="rbenv.install"
noextract=("v${pkgver}")
source=("https://github.com/rbenv/rbenv/tarball/v${pkgver}")
md5sums=('3925d0c04d3d86c6b695731e783fa3d2')

build() {
    cd $srcdir

    tar -x --strip-components 1 -zf "v$pkgver"
}

package() {
  cd $srcdir

  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/doc/$pkgname
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  mkdir -p $pkgdir/usr/lib/rbenv/completions
  mkdir -p $pkgdir/usr/lib/rbenv/libexec

  install -m 644 ./README.md $pkgdir/usr/share/doc/$pkgname
  install -m 644 ./LICENSE $pkgdir/usr/share/licenses/$pkgname
  install -m 644 ./completions/* $pkgdir/usr/lib/rbenv/completions/
  install -m 755 ./libexec/* $pkgdir/usr/lib/rbenv/libexec/

  ln -s /usr/lib/rbenv/libexec/rbenv $pkgdir/usr/bin/
}
