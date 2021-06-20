# Mantainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Paulo Diovani <paulo@diovani.com>

pkgname=torrentflix
pkgver=9.0.7
pkgrel=5
pkgdesc="Nodejs cli app to search torrent sites and stream using peerflix"
arch=('any')
url="https://www.npmjs.com/package/torrentflix"
license=('MIT')
depends=('nodejs' 'peerflix')
makedepends=('npm')
options=(!emptydirs)
source=("https://github.com/ItzBlitz98/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('e83a5ce8c7aecb28b30c8263fc0ab388ce5c64a9cda06461e4819fff211d00ef')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  npm install --cache ../cache -g --production --prefix "${pkgdir}/usr" "../v${pkgver}.tar.gz"

  # npm makes some directories world writable
  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  # https://old.reddit.com/r/archlinux/comments/o3y03g/i_adopted_10_nodejs_aur_packages_that_conflict/
  chown -R root:root "${pkgdir}"
}

# vim:set ts=2 sw=2 et:
