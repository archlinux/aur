# Maintainer: Sergii Fesenko <sergii underscore f dot at outlook dot com>

pkgname=nitrile-bin
pkgver=0.4.19
pkgrel=1
pkgdesc="A package manager and build tool for Clean programming language"
arch=(x86_64)
url="https://clean-and-itasks.gitlab.io/nitrile"
license=('AGPL-3.0-only')
depends=('z3' 'glibc')
makedepends=('jq' 'patchelf')
source=(
  "nitrile.tgz::$( curl -s https://clean-lang.org/api/packages/nitrile | jq -r .versions[.latest_version].targets.\"linux-x64\".url )"
)
md5sums=('SKIP')

pkgver() {
  echo nitrile-*-linux-x64 | sed 's/nitrile-//; s/-linux-x64//'
}

build() {
  cd "nitrile-${pkgver}-linux-x64"
  patchelf --replace-needed libz3.so.4 libz3.so ./bin/nitrile
}

package() {
  cd "nitrile-${pkgver}-linux-x64"

  install -Dm755 bin/nitrile ${pkgdir}/usr/bin/nitrile
}

