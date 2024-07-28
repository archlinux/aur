# Maintainer: Kacper Zybała <zyperpl at gmail dot com>

pkgname=cppfront
pkgver=0.7.2
pkgrel=1
pkgdesc="Experimental C++ Syntax 2->Syntax 1 compiler"
arch=('x86_64')
url="https://github.com/hsutter/cppfront"
license=('CC-BY-NC-ND-4.0')
makedepends=('gcc' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hsutter/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('fb44c6a65fa19b185ddf385dd3bfea05afe0bc8260382b7a8e3c75b3c9004cd6')
conflicts=('cppfront-git')

build() {
  pushd "${pkgname}-${pkgver}"
  g++ ${CXXFLAGS} -std=c++20 source/cppfront.cpp -o ${pkgname} 
  popd
}

package() {
  pushd "${pkgname}-${pkgver}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  install -dm755 "${pkgdir}/usr/share/${pkgname}/"
  install -Dm755 ${pkgname} "${pkgdir}/usr/share/${pkgname}/"
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  install -dm755 "${pkgdir}/usr/bin/"
  ln -sf "/usr/share/${pkgname}/${pkgname}" "${pkgdir}/usr/bin"

  find include/* -exec install -Dm644 '{}' -t "$pkgdir/usr/include/" ';'

  popd
}
