# Maintainer: Duncan Mac-Vicar P. <duncan@mac-vicar.eu>
pkgname=gondolin
pkgver=0.12.0
pkgrel=1
pkgdesc='Micro-VM sandbox CLI for running untrusted code with controlled filesystem and network access'
arch=('x86_64')
url='https://github.com/earendil-works/gondolin'
license=('Apache-2.0')
makedepends=('npm')
depends=('nodejs>=23.6.0' 'qemu-base' 'qemu-img')
options=(!strip)
source=("https://registry.npmjs.org/@earendil-works/gondolin/-/gondolin-$pkgver.tgz")
sha256sums=('27ad66f75fe76a848388291fa218e9ac9ac6dac47b9a818a3fcc589016a3f9e2')

package() {
  npm install -g --prefix "$pkgdir/usr" "$srcdir/gondolin-$pkgver.tgz"

  # npm records the build-time prefix in these files; drop them for reproducibility
  find "$pkgdir/usr/lib/node_modules" -name '.package-lock.json' -delete
  rm -rf "$pkgdir/usr/etc"

  install -Dm644 "$pkgdir/usr/lib/node_modules/@earendil-works/gondolin/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
