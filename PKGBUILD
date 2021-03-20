# Maintainer: João Figueiredo <jf.mundox@gmail.com>

pkgname=stylegan2-git
pkgver=r16.315ac54
pkgrel=1
pkgdesc='StyleGAN2 - Official TensorFlow Implementation'
arch=(any)
url='https://github.com/NVlabs/stylegan2'
license=(custom)
depends=(cuda python-{scipy,requests,pillow})
makedepends=(git)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  /opt/cuda/bin/nvcc test_nvcc.cu -o test_nvcc -run #If this fails, please check your CUDA installation.
}

package() {
  cd ${pkgname%-git}
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 *.py -t "$pkgdir/opt/stylegan2/"
  cp -dpr --no-preserve=ownership {dnnlib,metrics,training} "$pkgdir/opt/stylegan2/"
}
