pkgname=nodejs-solid-server
pkgver=5.6.6
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
sha512sums=('13e263adcda2cac67bc6e710cc4bc8a3ed825e7415b7b71170a740d548de5c814476f90aa68c670d4a29c0004de311d5574976eff7dde5fcd7e8887a1f784307'
            '2084520681f4f2b499a58ba94dcb4480745a3550a7041afe4c35f5ff743577caac312eb22e6ec109c82ed06d8bea335b4032b429c9d94e7640e036fdb007261c')
backup=('etc/solid-server/config.json')

package() {
  install -Dm 644 config.json $pkgdir/etc/solid-server/config.json
  npm install -g --user root --prefix $pkgdir/usr $srcdir/${pkgname#nodejs-}-$pkgver.tgz
  find $pkgdir/usr -type d -exec chmod 755 {} +
  mkdir -p $pkgdir/usr/share/webapps/solid-server/{data,.db}
}
