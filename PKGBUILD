# Maintainer: Georg Nagel <g.schlmm at gmail dot com>
# Contributor: Tom Vincent <aur@tlvince.com>

pkgname=astrojs-language-server
_pkgname=${pkgname#astrojs-}
pkgver=2.14.2
pkgrel=1
pkgdesc="The Astro language server, powered by Volar"
url="https://github.com/withastro/language-tools/tree/main/packages/language-server#readme"
license=("MIT")
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/@astrojs/${_pkgname}/-/${_pkgname}-${pkgver}.tgz")
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('09ef44d18ac92acb39ddb339748150076d3ada7c396b59a2f625a8d6db3f3886')

prepare() {
  tar xf "${_pkgname}-${pkgver}.tgz"
}

package() {
  npm install --global --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$_pkgname-$pkgver.tgz"

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}
