# Maintainer: Georg Nagel <g.schlmm at gmail dot com>
# Contributor: Tom Vincent <aur@tlvince.com>

pkgname=astrojs-language-server
_pkgname=${pkgname#astrojs-}
pkgver=2.15.5
pkgrel=1
pkgdesc="The Astro language server, powered by Volar"
url="https://github.com/withastro/language-tools/tree/main/packages/language-server#readme"
license=("MIT")
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/@astrojs/${_pkgname}/-/${_pkgname}-${pkgver}.tgz")
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('8ea2da9e176023ed414ae36863e2edcf72486fd1ec6b4740893e0d231dd4f409')

prepare() {
  tar xf "${_pkgname}-${pkgver}.tgz"
}

package() {
  npm install --global --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$_pkgname-$pkgver.tgz"

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}
