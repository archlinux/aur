# Maintainer: Sergii Fesenko <sergii underscore f dot at outlook dot com>

pkgname=lunarml-git
pkgver=2023.09.24.r891.f8d511e
pkgrel=1
pkgdesc="A Standard ML compiler that produces Lua/JavaScript "
arch=(x86_64)
url="https://github.com/minoki/LunarML.git"
license=('MIT')
depends=('gmp' 'glibc')
makedepends=('git' 'make' 'mlton' 'lua')
provides=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/minoki/LunarML.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  # there is no tags, so use info from last commit
  local CNT=$(git rev-list --count HEAD)
  local VERSION=$( git show -s --format='%cs.rCOMMIT_COUNT.%h' HEAD )
  sed "s/COMMIT_COUNT/$CNT/ ; s/-/./g" <<< "$VERSION"
}

build() {
  cd ${pkgname}
  make
}

check() {
	cd ${pkgname}
  # make test-lua
  # make test-lua-continuations
  # make test-luajit
  # make test-nodejs
  # make test-nodejs-cps
}

package() {
  cd ${pkgname}

  mkdir -p ${pkgdir}/usr/share/${pkgname}/
  cp -r example ${pkgdir}/usr/share/${pkgname}/

  install -Dm755 bin/lunarml ${pkgdir}/usr/bin/lunarml
  install -Dm644 --target-directory=${pkgdir}/usr/share/licenses/${pkgname} LICENSE
}

