# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

_pkgname=nps
pkgname=nodejs-nps
pkgver=5.10.0
pkgrel=2
pkgdesc="All the benefits of npm scripts without the cost of a bloated package.json and limits of json"
url="https://github.com/sezna/$_pkgname"
license=("MIT")
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$_pkgname-$pkgver.tgz")
sha256sums=('10dc9bdc1d2c43af359347c0626e2c6b3142e5c45bd0a23f2aa1516b237eaeff')

prepare() {
  tar xf "$_pkgname-$pkgver.tgz" package/LICENSE
}

package() {
  npm i -g --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$_pkgname-$pkgver.tgz"
  install -Dm644 package/LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 <(nps completion) "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
}
