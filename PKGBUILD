pkgname=nodejs-solid-server
pkgver=5.1.5
pkgrel=1
pkgdesc="Solid server on top of the file-system"
arch=(any)
url="http://github.com/solid/node-solid-server"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("http://registry.npmjs.org/${pkgname#nodejs-}/-/${pkgname#nodejs-}-$pkgver.tgz"
        "config.json")
noextract=(${npmname#nodejs-}-$pkgver.tgz)
sha512sums=('027a5297d5a7b4eecb36257ebc8df71bf717bb521f95b618880838cd3f50eecbb61c399955fdedddecea2be9b36b6f9d369c99e9b924a3583dfdfcfb1c547135'
            '2084520681f4f2b499a58ba94dcb4480745a3550a7041afe4c35f5ff743577caac312eb22e6ec109c82ed06d8bea335b4032b429c9d94e7640e036fdb007261c')
backup=('etc/solid-server/config.json')

package() {
  install -Dm 644 config.json $pkgdir/etc/solid-server/config.json
  npm install -g --user root --prefix $pkgdir/usr $srcdir/${pkgname#nodejs-}-$pkgver.tgz
  find $pkgdir/usr -type d -exec chmod 755 {} +
  mkdir -p $pkgdir/usr/share/webapps/solid-server/{data,.db}
}
