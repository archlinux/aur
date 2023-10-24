# Maintainer: Robert Hamblin <hamblingreen@hotmail.com>
pkgname=libweb
pkgver=0.1.0
pkgrel=2
pkgdesc="A simple and lightweight web framework"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://gitea.privatedns.org/xavi/libweb"
license=('GPL3')
makedepends=('dynstr')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver-rc3.tar.gz"
	"libweb.pc")
sha512sums=('d7c1d05b6715d7fa903a3dc2687b82d6b99cc3a82303ca5b9d55764f16f61dc7c6af7416f09fce0cbc62bcda58ff4680e38cb6079b304c5fedc480ad1d3578ee'
            '5474c2e4d0ffd381bb30559a6297617dd366b4fbc2629e18ca7e8005263399a6d2e76a4eb27878288e1a8bcaa439936db43372bb348c56d616239900e65bf5c9')

build() {
  cd "$pkgname"

  make
}

package() {
  mkdir -p "$pkgdir/usr/share/pkgconfig"
  install "libweb.pc" "$pkgdir/usr/share/pkgconfig/"

  cd "$pkgname"

  mkdir -p "$pkgdir/usr/include/libweb"
  install -Dm644 include/libweb/* "$pkgdir/usr/include/libweb/"

  mkdir -p "$pkgdir/usr/lib"
  install -Dm755 "libweb.a" "$pkgdir/usr/lib/"

  cd "doc"

  make PREFIX="$pkgdir" install
}

