# Maintainer: LightQuantum <self at lightquantum dot me>
pkgname=ossfs-git
_pkgname=ossfs
pkgver=1.80.6.r0.g9640e79
pkgrel=1
pkgdesc='The OSSFS enables you to mount Alibaba Cloud OSS buckets to a local file in Linux/Mac OS X systems.'
arch=('x86_64')
url="https://github.com/aliyun/ossfs"
license=('GPL2')
makedepends=('git')
depends=('fuse' 'man' 'libxml2' 'curl')
source=("git+https://github.com/aliyun/$_pkgname")
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --long --tags |sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  ./autogen.sh
  ./configure --prefix=/usr
  make $MAKEFLAGS
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir/" install
}
