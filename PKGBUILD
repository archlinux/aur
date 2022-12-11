# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=python-waifu2x-vulkan
_gitname=${pkgname#python-}
pkgver=1.1.5
pkgrel=1
pkgdesc="waifu2x-ncnn-vulkan-python, use nihui/waifu2x-ncnn-vulkan"
arch=('x86_64')
url="https://github.com/tonquer/waifu2x-vulkan"
license=('MIT')
makedepends=('python-setuptools'
             'cmake'
             'git'
             'glslang'
             'vulkan-headers')
# need Vulkan driver for your GPU card
depends=('vulkan-icd-loader'
         'vulkan-driver')
# source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_gitname}-${pkgver}.tar.gz")
provides=('python-waifu2x-ncnn-vulkan')
conflicts=('python-waifu2x-ncnn-vulkan')
MAKEFLAGS=-j4
sha256sums=('f30b2d79b4ada0826f7a765b53515b149d6bbfbdeb6c59c1a6f846f2011f2076')

build() {
  cd ${_gitname}-${pkgver}

  python setup.py build
}

package() {
  cd ${_gitname}-${pkgver}

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
# vim: ts=2 sw=2 et:
