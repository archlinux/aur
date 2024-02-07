# Maintainer:  m0ar < edvard [at] hubinette dot me>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

pkgname=cloudflare-wrangler2
pkgver=3.27.0
pkgrel=1
pkgdesc='Command-line tool for working with Cloudflare Workers'
arch=('x86_64')
url="https://www.npmjs.com/package/wrangler"
license=('MIT OR Apache-2.0')
depends=('nodejs' 'glibc')
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::https://registry.npmjs.org/wrangler/-/wrangler-$pkgver.tgz"
        "LICENSE-MIT::https://raw.githubusercontent.com/cloudflare/workers-sdk/main/LICENSE-MIT")
noextract=("$pkgname-$pkgver.tar.gz")
md5sums=('25da73b90b9ae1f34ac04ffe10320608'
         'a02f91b8dd3b6abe453990b6e5bd19f7')

package() {
  npm install \
    -g \
    --cache "${srcdir}/npm-cache" \
    --prefix "${pkgdir}/usr" \
    "${srcdir}/${pkgname}-${pkgver}.tar.gz"

  # Do not provide 'wrangler' to prevent clash with v1
  unlink "$pkgdir/usr/bin/wrangler"

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"

  install -Dm644 'LICENSE-MIT' -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

