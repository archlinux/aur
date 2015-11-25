# Maintainer: Chris Down <chris@chrisdown.name>
# Contributor: Vladimir Chizhov <jagoterr@gmail.com>
# Contributor: Jochen Schalanda <jochen+aur (-AT-) schalanda.name>
# Contributor: Ichimonji10 <Ichimonji10@gmail.com>
pkgname=rbenv
pkgver=0.4.0
pkgrel=2
pkgdesc="Simple Ruby version manager"
arch=('any')
url="https://github.com/sstephenson/rbenv"
license=('MIT')
depends=()
optdepends=('ruby-build')
conflicts=('rbenv-git')
install="rbenv.install"
noextract=("v${pkgver}")
source=("https://github.com/sstephenson/rbenv/tarball/v${pkgver}")
md5sums=('89be6977f7c47655c41900ab55a48c6b')

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
