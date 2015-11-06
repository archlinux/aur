pkgname=premake-ninja-git
pkgver=r76.a256323
pkgrel=1
pkgdesc='Premake extension to support Ninja'
arch=(any)
url='http://industriousone.com/premake'
license=(MIT)
depends=(premake-git ninja)
makedepends=(git)
checkdepends=(python)
source=(git+https://github.com/jimon/premake-ninja)
md5sums=('SKIP')

pkgver() {
  cd premake-ninja
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd premake-ninja/tests
  # tests fail
  python ./run_tests.py
}

package() {
  cd premake-ninja
  install -Dm755 -d "$pkgdir"/usr/share/premake/
  install -Dm644 *.lua "$pkgdir"/usr/share/premake/
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
