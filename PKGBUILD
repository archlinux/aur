# Maintainer: Crepe <cleared@airmail.cc>
# https://wiki.archlinux.org/title/Python_package_guidelines
pkgname=linux-mdss-dsi-panel-driver-generator
pkgver=0
pkgrel=0
arch=('any')
url=https://github.com/msm8916-mainline/$pkgname
license=('GPL2')
pkgdesc='Generate Linux DRM panel kernel driver based on QCOM MDSS DSI device tree '
depends=(
  'python'
)
makedepends=()
_commit=c917fccebe485cab2465c8258fc8418f481869b1
source=("$url/archive/$_commit.tar.gz")
sha512sums=('961c35a40a5b1cf24197fc781b3aba0d5830206141f9e5eb755c5675fd6357f3b8864485ccbc1c4e967bb891cd1a59754b6db8d06b5fb5aec87502ea868279b1')

package() {
  mkdir -p "$pkgdir/opt/$pkgname"
  cp -R $srcdir/$pkgname-$_commit/* "$pkgdir/opt/$pkgname"
  chmod 755 $pkgdir/opt/$pkgname/lmdpdg.py
  chmod 755 $pkgdir/opt/$pkgname/tools/*
  # scripts
  mkdir -p $pkgdir/usr/bin/
  ln -s "/opt/$pkgname/lmdpdg.py" "$pkgdir/usr/bin/lmdpdg"
  ln -s "/opt/$pkgname/tools/unpackbootimg.py" "$pkgdir/usr/bin/unpackbootimg"
  ln -s "/opt/$pkgname/tools/unpackqcdt.py" "$pkgdir/usr/bin/unpackqcdt"
}
