# Maintainer: D3SOX <d3sox at protonmail dot com>

_reponame=Swig
pkgname=swig-cli
pkgver=3.0.0
pkgrel=1
pkgdesc="An easy to use git config manager"
arch=(any)
url="https://github.com/AlexanderDotH/$_reponame"
license=(custom)
depends=(git xdg-utils)
makedepends=(dotnet-host dotnet-sdk)
options=(!strip)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$_reponame-$pkgver/Build"
  # modify build.sh to remove dotnet publish lines which do not contain linux
  sed -i '/linux/! s/^dotnet publish/#dotnet publish/' build.sh
  chmod +x build.sh
}

build() {
  cd "$srcdir/$_reponame-$pkgver/Build"
  ./build.sh || true
}

package() {
  install -Dm644 "$srcdir/$_reponame-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "$srcdir/$_reponame-$pkgver/Build/Swig/Linux/Swig.Console" "$pkgdir/usr/bin/swig-cli"
}
