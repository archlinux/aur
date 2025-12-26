# Maintainer: Alexis "Horgix" Chotard <aur+nx@foss.horgix.fr>
# Send contributions to: https://github.com/Horgix/aur-package_nx_mirror

# Package is not named `nx` because it is already the basename of the `nx-x11`
# package: https://aur.archlinux.org/packages/nx-x11

pkgname=nx-build
pkgver=22.3.3
pkgrel=1
pkgdesc="An AI-first build platform that connects everything from your editor to CI."
arch=(any)
url="https://nx.dev/"
license=('MIT')
makedepends=('npm')
depends=('nodejs')
noextract=("${pkgname}-${pkgver}.tgz")
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
sha512sums=('a4ec6d29651fbdfd280fc19eaacf03f3d436c69b2d45369263e17a52dfd67741a71235233b7d924b5ca600ce9682018f1c364de2aa4dadde5c7c8c509806d12e')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  chown 0:0 -R "$pkgdir"
}
