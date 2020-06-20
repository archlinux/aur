# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=darknet-git
pkgver=r437.0ff23438
pkgrel=1
pkgdesc="An open source neural network framework written in C and CUDA"
arch=('x86_64')
url='https://pjreddie.com/darknet'
license=('Unlicense')
depends=('bash')
optdepends=('opencv' 'cuda' 'python')
provides=("${pkgname%-git}")
source=("darknet::git+https://github.com/pjreddie/darknet")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${pkgname%-git}
  make
}

package() {
  install -Dm755 "${srcdir}/${pkgname%-git}/${pkgname%-git}" -t "${pkgdir}/usr/bin/"
  install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
  install -Dm644 "${srcdir}/${pkgname%-git}/libdarknet.so" "${pkgdir}/usr/lib/libdarknet.so"
  install -Dm644 "${srcdir}/${pkgname%-git}/libdarknet.a" "${pkgdir}/usr/lib/libdarknet.a"
  install -Dm644 "${srcdir}/${pkgname%-git}/include/${pkgname%-git}.h" -t "${pkgdir}/usr/include"
  mkdir -p "${pkgdir}/usr/share/${pkgname%-git}/"
  mkdir -p "${pkgdir}/etc/${pkgname%-git}"
  mv "${srcdir}/${pkgname%-git}/data" "${pkgdir}/usr/share/${pkgname%-git}/"
  mv "${srcdir}/${pkgname%-git}/examples" "${pkgdir}/usr/share/${pkgname%-git}/"
  mv "${srcdir}/${pkgname%-git}/scripts" "${pkgdir}/usr/share/${pkgname%-git}/"
  mv "${srcdir}/${pkgname%-git}/python" "${pkgdir}/usr/share/${pkgname%-git}/"
  mv "${srcdir}/${pkgname%-git}/cfg"/* "${pkgdir}/etc/${pkgname%-git}"
}